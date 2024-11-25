import 'dart:async';
import 'dart:developer';

import 'package:mobile_scanner/mobile_scanner.dart';

import '../../helper/app_export.dart';
import 'package:http/http.dart' as http;

import '../batchercode/batchercode_model.dart';
import '../newscanned/dude.dart';
import '../spinning/testingspinning.dart';
import '../weaving/new_weaving_view.dart';

class QRScannerBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<QRScannerController>(QRScannerController());
  }
}

class QRScannerController extends GetxController with WidgetsBindingObserver {
  late Barcode result;
  final MobileScannerController mobileScannerController = MobileScannerController();
  StreamSubscription<Object?>? _subscription;
  var isLoading = false.obs;
  HomeController homeController = Get.find<HomeController>();
  late InquiryDetailsController inquiryDetailsController;
  late PoDetailsController poDetailsController;
  late OrderDetailsController orderDetailsController;


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!mobileScannerController.value.hasCameraPermission) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.paused:
        break;

        case AppLifecycleState.resumed:
      // Restart the scanner when the app is resumed.
      // Don't forget to resume listening to the barcode events.
        _subscription = mobileScannerController.barcodes.listen(onScanned);

        unawaited(mobileScannerController.start());
        break;
      case AppLifecycleState.inactive:
      // Stop the scanner when the app is paused.
      // Also stop the barcode events subscription.
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(mobileScannerController.stop());
        break;
    }
  }


  @override
  void onInit() {
    isLoading.value = true;
    _subscription = mobileScannerController.barcodes.listen(onScanned);
    unawaited(mobileScannerController.start());
    Future.delayed(const Duration(milliseconds: 2000), () async {
      isLoading.value = false;
    });
    if (homeController.selectedScanType.value == ScanType.inquiry.index &&
        homeController.isScanSearch.value) {
      inquiryDetailsController = Get.find<InquiryDetailsController>();
    } else if (homeController.selectedScanType.value ==
            ScanType.purchaseOrder.index &&
        homeController.isScanSearch.value) {
      poDetailsController = Get.find<PoDetailsController>();
    } else if (homeController.selectedScanType.value ==
            ScanType.orderSheet.index &&
        homeController.isScanSearch.value) {
      orderDetailsController = Get.find<OrderDetailsController>();
    }
    super.onInit();
  }

  void onScanned(BarcodeCapture barcode) {
    result = barcode.barcodes.first;
    print('onScanned result: ${result.displayValue}');
    isLoading.value = true;
    mobileScannerController.stop();
    Future.delayed(const Duration(seconds: 1), () async {
      if (!homeController.isScanSearch.value) {
        Get.back(closeOverlays: true);
        if (homeController.selectedScanType.value == ScanType.inquiry.index) {
          homeController.inquirySearch(scanCode: '${result.displayValue}');
        }
        else if(homeController.selectedScanType.value == ScanType.batcherCode.index){
          _makeApiCall(result.displayValue??"");
        }
        else if(homeController.selectedScanType.value == ScanType.yarnPallete.index){
          Dude(dululu: result.displayValue??"");
        }
        else if (homeController.selectedScanType.value ==
            ScanType.purchaseOrder.index) {
          homeController.poSearch(scanCode: '${result.displayValue}');
        } else if (homeController.selectedScanType.value ==
            ScanType.orderSheet.index) {
          Get.back();
          homeController
              .orderSheetSearch(scanCode: '${result.displayValue}');
        }
      }

      else if (homeController.selectedScanType.value == ScanType.inquiry.index) {
        Get.back();
        inquiryDetailsController.search('${result.displayValue}');
      } else if (homeController.selectedScanType.value ==
          ScanType.purchaseOrder.index) {
        Get.back();
        poDetailsController.search('${result.displayValue}');
      } else if (homeController.selectedScanType.value ==
          ScanType.orderSheet.index) {
        Get.back();
        orderDetailsController.search('${result.displayValue}');
      }
      isLoading.value = false;
    });

    //controller.qrController.resumeCamera();
   // mobileScannerController.start();
  }

  Future<void> _makeApiCall(String batchNo) async {
    isLoading.value = true;
    log("batchNo = $batchNo");
    final response = await http.get(Uri.parse(
        'https://traceability.feroze1888.com:6023/api/TraceMain/GetInquiryDataByBatchNo?batchNo=$batchNo'));
    print("Api response = ${response.body}");
    print("batch code is ${batchNo}");
    if (response.statusCode == 200) {
      final BatcherResponse batcherResponse =
      BatcherResponse.fromJson(json.decode(response.body));

      if (batcherResponse.result == null) {
        //Get snackbar
        isLoading.value = false;
        Get.snackbar("Error","No data found");
        return;
      }
      //controller?.pauseCamera();
      // Show popup with options
      _showOptionsPopup(batcherResponse);
    } else {
      isLoading.value = false;
      // Handle error
      Get.snackbar("Error","Error in fetching data");
    }
  }

  void _showOptionsPopup(BatcherResponse batcherResponse) {
    isLoading.value = false;
    Get.dialog(
      barrierDismissible: true,
      WillPopScope(
        onWillPop: () async {
          Get.back(closeOverlays: true);
          return true;
        },
        child: AlertDialog(
          title: const Text('Details Available'),
          content: const Text(
              'Would you like to see spinning details or viewing details?'),
          actions: [
            TextButton(
              onPressed: () {
                if (batcherResponse.result!.spinningdata == null ||
                    batcherResponse.result!.spinningdata!.isEmpty) {
                  Get.snackbar('No spinning data found', 'No spinning data found');
                  return;
                }
                Get.back(closeOverlays: true);
                Get.to(() => Spin(
                  inqu: batcherResponse.result!.spinningdata![0].inquiryNo
                      .toString(),));
              },
              child: Text(
                  'Spinning Details (${batcherResponse.result!.spinningdata
                      ?.length})'),
            ),
            TextButton(
              onPressed: () {
                if (batcherResponse.result!.weavingdata == null ||
                    batcherResponse.result!.weavingdata!.isEmpty) {
                  Get.snackbar('No weaving data found', 'No weaving data found');
                  return;
                }
                Get.back(closeOverlays: true);
                Get.to(() => NewWeavingView(
                  inquiryNo: batcherResponse.result!.weavingdata![0]
                      .factoryInquiry.toString(),
                  custName: batcherResponse.result!.weavingdata![0]
                      .weaverName.toString(),));
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>NewWeavingView(weavingData: batcherResponse.result!.weavingdata!,)));
                // Navigate to Viewing details screen or do whatever you need
                // For example: Get.to(ViewingDetailsScreen(data: batcherResponse.result.weavingdata));
              },
              child: Text(
                  'Weaving Details (${batcherResponse.result!.weavingdata
                      ?.length})'),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    // Stop listening to the barcode events.
    unawaited(_subscription?.cancel());
    _subscription = null;
    // Dispose the widget itself.
    super.dispose();
    // Finally, dispose of the controller.
    await mobileScannerController.dispose();
  }

  String titleScan() {
    var title = "for Search";
    // if (homeController.selectedScanType.value == ScanType.inquiry.index) {
    //   title = "Inquiry";
    // } else if (homeController.selectedScanType.value ==
    //     ScanType.purchaseOrder.index) {
    //   title = "Purchase Order";
    // } else if (homeController.selectedScanType.value ==
    //     ScanType.orderSheet.index) {
    //   title = "Order Sheet";
    // } else {
    //   title = "for Search";
    // }
    return title;
  }
}

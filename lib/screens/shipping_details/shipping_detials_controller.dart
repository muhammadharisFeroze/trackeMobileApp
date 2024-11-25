import '../../helper/app_export.dart';

class ShippingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ShippingDetailsController>(ShippingDetailsController());
  }
}

class ShippingDetailsController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  var isLoading = false.obs;
  var shipmentList = <Shipment>[].obs;

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(scrollListener);
    getShipmentsService();
    super.onInit();
  }

  void scrollListener() {
    // if (scrollController.hasClients &&
    //     scrollController.offset > (GlobalValues.silverMoreScroll)) {
    //   isSliverAppBarExpanded.value = true;
    // } else {
    //   isSliverAppBarExpanded.value = false;
    // }
  }

  void getShipmentsService() {
    isLoading.value = true;
    shipmentList.value = [];
    var number = "";
    var type = constPONo;
    if (homeController.selectedScanType.value == ScanType.orderSheet.index) {
      type = constOrderSheetNo;
      number = "${homeController.selectedItem.value.osNo ?? ""}";
    } else {
      type = constPONo;
      number = "${homeController.selectedItem.value.osNo ?? ""}";
    }
    ApiProvider()
        .get(
            url:
                "${ApiProvider.getShipments}?$constUserID=${homeController.userInfo.info!.userId}&$constNumber=$number&$constType=$type")
        .then((onValue) async {
      var response =
          GeneralResponseModel<ShipmentsDataResponseModel>.fromJson(onValue);

      debugPrint("response ${response.result}");

      if (response.response?.responseCode == 0 &&
          response.result?.shipments != null) {
        shipmentList.value = response.result?.shipments ?? [];
      } else {
        Get.bottomSheet(BottomSheetCustom(
          message: '${response.response?.responseMessage}',
          isBack: true,
          navigationBack: () {
            Get.back();
            Get.back();
          },
        ));
      }
    }, onError: (error) {
      Get.bottomSheet(BottomSheetCustom(
        message: '$error',
        isBack: true,
        navigationBack: () {
          Get.back();
          Get.back();
        },
      ));
    }).whenComplete(() {
      isLoading.value = false;
    });
  }
}

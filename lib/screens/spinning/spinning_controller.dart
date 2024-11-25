import 'package:feroze_mills/helper/app_export.dart';
import 'package:feroze_mills/screens/spinning/spinning_data_response_model.dart';
import '../order_status/order_status_controller.dart';

OrderStatusController orderStatusController = OrderStatusController();

class SpinningBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<SpinningController>(SpinningController());
    //  Get.put<SpinningController>(SpinningController());
  }
}

class SpinningController extends GetxController {
  HomeController homecontroller = Get.find<HomeController>();
  //HomeController homecontroller = Get.find<HomeController>();
  //HomeController homeController = Get.find<HomeController>();
  late ScrollController scrollController;
  final box = GetStorage();
  var isSliverAppBarExpanded = false.obs;
  // var weaverIssueReceivedList = <WeaverIssueReceived>[].obs;
  var isLoading = false.obs;
  // var spinningList = [].obs;
  var spinningList = <SpinningData>[].obs;
  var spinningDataList = <DataList>[].obs;
  DataList spinningData = DataList();
  SpinningData spinningdata = SpinningData(response: null, result: null);

  @override
  void onInit() {
    print('spinning api called');
    scrollController = ScrollController()..addListener(scrollListener);
    getSpinningDataService();
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

  void getSpinningDataService({bool isLoding = true}) {
    isLoading.value = isLoding;
    print('inquiryyyyyyyyyyyyyy${box.read('inquiry_value')}');
    String inquiryNumb = box.read('inquiry_value');

    // print(
    // "${ApiProvider.getSpinningData}?$constUserID=${3.userInfo.info!.userId}&$constInquiryNo=${homeController.selectedItem.value.osNo ?? ""}");
    // ApiProvider()
    //   .get(
    //     url:
    //       "${ApiProvider.getSpinningData}? $constUserID =${homecontroller.userInfo.info!.userId} & $constInquiryNo = ${homecontroller.selectedItem.value.osNo ?? ""}")
    ApiProvider()
        .get(
            url:
                "${ApiProvider.getSpinningData}?$constUserID=${homecontroller.userInfo.info!.userId}&$constInquiryNo=$inquiryNumb  &$constOrderSheetNo=$inquiryNumb")
        // ApiProvider.getSpinningData + homeController.selectedItem.value.osNo??)
        // 'https://traceability.feroze1888.com:6023/api/TraceMain/GetSpinningByInquiry?inquiryNo=63137'
        // )
        //"${ApiProvider.getSpinningData}?$constUserID=${homeController.userInfo.info!.userId}&$constInquiryNo=${homeController.selectedItem.value.osNo ?? ""}")
        .then((onValue) async {
      // print('spinning response onvalue: ${onValue['result']}');
      //   var response = GeneralResponseModel<SpinningData>.fromJson(onValue);
      //   SpinningData.fromJson(onValue);

      var response =
          GeneralResponseModel<WeavingdataResponseModel>.fromJson(onValue);

      debugPrint("response ${response.result}");

      //if (response.response?.responseCode == 0 && response.result != null) {
      if (onValue['response']['responseCode'] == 0 &&
          onValue['result'] != null) {
        print('condition is true');
        spinningDataList = RxList<DataList>.of(
            List.from(onValue['result']['dataList']).map<DataList>((e) {
          return DataList.fromJson(e);
        }).toList());

        // spinningList.addAll(response.result?.toJson('') ?? []);
        // print(
        //     'spinning response success  ${spinningList[0].result!.dataList[0].inquiryNo}');

        // spinningList.addAll(response.result?.weavingdata ?? []);
        // getOrderStatusService(isLoding: false);
      } else {
        Get.bottomSheet(BottomSheetCustom(
          // message: '${response.response?.responseMessage}',
          message: '${onValue['response']['responseMessage']}',
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

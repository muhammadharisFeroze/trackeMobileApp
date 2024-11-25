import 'package:feroze_mills/helper/app_export.dart';

class InquiryDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<InquiryDetailsController>(InquiryDetailsController());
  }
}

class InquiryDetailsController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  var isLoading = false.obs;
  late TextEditingController searchTextController;

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(scrollListener);
    searchOrderDataByNoService();
    searchTextController = TextEditingController();
    super.onInit();
  }

  void scrollListener() {
    // if (scrollController.offset > (GlobalValues.silverMoreScroll)) {
    //   isSliverAppBarExpanded.value = true;
    // } else {
    //   isSliverAppBarExpanded.value = false;
    // }
  }

  void searchOrderDataByNoService() {
    homeController.selectedItem.value = OrderData();
    isLoading.value = true;
    homeController.orderDataList.value = [];
    var type = constInquiryNo;
    if (homeController.selectedScanType.value == ScanType.inquiry.index) {
      type = constInquiryNo;
    } else if (homeController.selectedScanType.value ==
        ScanType.purchaseOrder.index) {
      type = constPONo;
    } else if (homeController.selectedScanType.value ==
        ScanType.orderSheet.index) {
      type = constOrderSheetNo;
    }
    ApiProvider()
        .get(
            url:
                "${ApiProvider.searchOrderDataByNo}?$constUserID=${homeController.userInfo.info!.userId}&$constNumber=${homeController.number.value}&$constType=$type")
        .then((onValue) async {
      var response =
          GeneralResponseModel<SearchDataResponseModel>.fromJson(onValue);

      debugPrint("response ${response.result}");

      if (response.response?.responseCode == 0) {
        if (response.result?.orderData != null) {
          homeController.orderDataList.value = response.result?.orderData ?? [];
          homeController.searchList.value = homeController.orderDataList;
          if (homeController.orderDataList.isNotEmpty) {
            homeController.selectedItem.value = homeController.orderDataList[0];
          } else {
            Get.bottomSheet(BottomSheetCustom(
              message: 'No Data Found',
              isBack: true,
              navigationBack: () {
                Get.back();
                Get.back();
              },
            ));
          }
        }
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

  void search(String value) {
    homeController.searchList.value = [];
    if (value.isNotEmpty) {
      for (var item in homeController.orderDataList) {
        if (item.poNoBuyer!.contains(value.toUpperCase())) {
          homeController.searchList.add(item);
        }
      }
    } else {
      homeController.searchList.value = homeController.orderDataList;
    }
    if (homeController.isScanSearch.value) {
      searchTextController.text = value;
    }
    homeController.isScanSearch.value = false;
  }
}

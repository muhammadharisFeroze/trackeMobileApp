import '../../helper/app_export.dart';

class PoDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PoDetailsController>(PoDetailsController());
  }
}

class PoDetailsController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  var isLoading = false.obs;
  late TextEditingController searchTextController;
  var qualityCodeList = <Qualitycode>[].obs;
  var searchList = <Qualitycode>[].obs;

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(scrollListener);
    searchTextController = TextEditingController();
    // if (homeController.selectedItem.value.poNoBuyer != null) {
    homeController.number.value =
        homeController.selectedItem.value.inquiryNo ?? "";
    // for (var item in homeController.orderDataList) {
    //   if (item.poNoBuyer == homeController.selectedItem.value.poNoBuyer) {
    //     qualityCodeList.add(item);
    //   }
    // }
    qualityCodeList.value =
        homeController.selectedItem.value.qualitycodes ?? [];
    searchList.value = qualityCodeList;
    // } else {
    //   searchOrderDataByNoService();
    // }
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

  void searchOrderDataByNoService() {
    homeController.selectedItem.value = OrderData();
    isLoading.value = true;
    qualityCodeList.value = [];
    ApiProvider()
        .get(
            url:
                "${ApiProvider.searchOrderDataByNo}?$constUserID=${homeController.userInfo.info!.userId}&$constNumber=${homeController.number}&$constType=PONo")
        .then((onValue) async {
      var response =
          GeneralResponseModel<SearchDataResponseModel>.fromJson(onValue);

      debugPrint("response ${response.result}");

      if (response.response?.responseCode == 0 &&
          response.result?.orderData != null) {
        // qualityCodeList.value = response.result?.orderData ?? [];
        // searchList.value = qualityCodeList;
        // if (qualityCodeList.isNotEmpty) {
        //   homeController.selectedItem.value = qualityCodeList[0];
        // }
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
    searchList.value = [];
    if (value.isNotEmpty) {
      for (var item in qualityCodeList) {
        if (item.qualityCode!.contains(value.toUpperCase())) {
          searchList.add(item);
        }
      }
    } else {
      searchList.value = qualityCodeList;
    }
    if (homeController.isScanSearch.value) {
      searchTextController.text = value;
    }
    homeController.isScanSearch.value = false;
  }
}

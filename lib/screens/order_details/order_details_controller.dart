import 'package:feroze_mills/helper/app_export.dart';

class OrderDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<OrderDetailsController>(OrderDetailsController());
  }
}

class OrderDetailsController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  var isLoading = false.obs;
  late TextEditingController searchTextController;
  var orderDataList = <Qualitycode>[].obs;
  var searchList = <Qualitycode>[].obs;

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(scrollListener);
    // searchOrderDataByNoService();
    searchTextController = TextEditingController();
    homeController.number.value =
        homeController.selectedItem.value.inquiryNo ?? "";
    orderDataList.value = homeController.selectedItem.value.qualitycodes ?? [];
    searchList.value = orderDataList;
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
    orderDataList.value = [];
    ApiProvider()
        .get(
            url:
                "${ApiProvider.searchOrderDataByNo}?$constUserID=${homeController.userInfo.info!.userId}&$constNumber=${homeController.number}&$constType=OrderSheetNo")
        .then((onValue) async {
      var response =
          GeneralResponseModel<SearchDataResponseModel>.fromJson(onValue);

      debugPrint("response ${response.result}");

      if (response.response?.responseCode == 0) {
        if (response.result?.orderData != null) {
          // orderDataList.value = response.result?.orderData ?? [];
          // searchList.value = orderDataList;
          // if (orderDataList.isNotEmpty) {
          //   homeController.selectedItem.value = orderDataList[0];
          // }
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
    searchList.value = [];
    if (value.isNotEmpty) {
      for (var item in orderDataList) {
        if (item.qualityCode!.contains(value.toUpperCase())) {
          searchList.add(item);
        }
      }
    } else {
      searchList.value = orderDataList;
    }
    if (homeController.isScanSearch.value) {
      searchTextController.text = value;
    }
    homeController.isScanSearch.value = false;
  }
}

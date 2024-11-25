import '../../helper/app_export.dart';

class TreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TreeController>(TreeController());
  }
}

class TreeController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  var isLoading = false.obs;
  var treeList = <Tree>[].obs;

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(scrollListener);
    getTreeDataService();
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

  void getTreeDataService() {
    isLoading.value = true;
    var type = constInquiryNo;
    var number = "";
    if (homeController.selectedScanType.value == ScanType.inquiry.index) {
      type = constInquiryNo;
      number = homeController.selectedItem.value.inquiryNo ?? "";
    } else {
      type = constPONo;
      number = homeController.selectedItem.value.poNoBuyer ?? "";
    }
    ApiProvider()
        .get(
            url:
                "${ApiProvider.getTree}?$constUserID=${homeController.userInfo.info!.userId}&$constNumber=$number&$constType=$type")
        .then((onValue) async {
      var response =
          GeneralResponseModel<TreeViewDataResponseModel>.fromJson(onValue);
      debugPrint("response ${response.result}");

      if (response.response?.responseCode == 0 && response.result != null) {
        treeList.value = response.result?.tree ?? [];
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

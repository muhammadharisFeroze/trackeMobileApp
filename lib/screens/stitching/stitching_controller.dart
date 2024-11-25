import '../../helper/app_export.dart';

class StitchingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StitchingController>(StitchingController());
  }
}

class StitchingController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  var dyeingIssueReceivedList = <DyeingIssueReceived>[].obs;
  var isLoading = false.obs;
  var stichingList = <StichingData>[].obs;

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(scrollListener);
    getStichingDataService();
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

  void getStichingDataService() {
    isLoading.value = true;
    var type = constPONo;
    var number = "";
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
                "${ApiProvider.getStichingData}?$constUserID=${homeController.userInfo.info!.userId}&$constNumber=$number&$constType=$type")
        .then((onValue) async {
      var response =
          GeneralResponseModel<StichingDataResponseModel>.fromJson(onValue);
      debugPrint("response ${response.result}");

      if (response.response?.responseCode == 0 && response.result != null) {
        stichingList.value = response.result?.stichingData ?? [];
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

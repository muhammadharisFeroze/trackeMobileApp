import 'package:feroze_mills/helper/app_export.dart';
import 'package:feroze_mills/screens/order_status/statuses_count_data_response_model.dart';

class OrderStatusBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<OrderStatusController>(OrderStatusController());
  }
}

class OrderStatusController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  var isLoading = false.obs;
  var statusesCount = StatusesCount().obs;

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(scrollListener);
    getOrderStatusService();
    super.onInit();
  }

  void scrollListener() {
    if (scrollController.hasClients &&
        scrollController.offset > (GlobalValues.silverMoreScroll)) {
      isSliverAppBarExpanded.value = true;
    } else {
      isSliverAppBarExpanded.value = false;
    }
  }

  void getOrderStatusService() {
    isLoading.value = true;
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
                "${ApiProvider.getOrderStatus}?$constUserID=${homeController.userInfo.info!.userId}&$constInquiryNo=${homeController.selectedItem.value.inquiryNo ?? ""}&$constNumber=$number&$constType=$type")
        .then((onValue) async {
      var response = StatusesCountDataResponseModel.fromJson(onValue);

      debugPrint("response ${response.result}");

      if (response.response?.responseCode == 0 && response.result != null) {
        statusesCount.value = response.result?.statusesCount ?? StatusesCount();
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

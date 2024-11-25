import '../../helper/app_export.dart';

class VerifyEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VerifyEmailController>(VerifyEmailController());
  }
}

class VerifyEmailController extends GetxController {
  late ScrollController scrollController;
  String otpCode = '';
  var isSliverAppBarExpanded = false.obs;
  var isError = false;

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(scrollListener);
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
}

import '../../helper/app_export.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(ForgotPasswordController());
  }
}

class ForgotPasswordController extends GetxController {
  late TextEditingController emailController;
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(scrollListener);
    emailController = TextEditingController();
    // emailController.text = 'waseem.akram@codelabs.inc';
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

  void forgotPasswordService(BuildContext context) {
    isLoading.value = true;
    var parameters = {
      constEmail: emailController.text,
    };
    debugPrint("parameters $parameters");
    ApiProvider()
        .postObject(url: ApiProvider.forgotPassword, body: parameters)
        .then((onValue) async {
      var response = GeneralResponseModel.fromJson(onValue);

      debugPrint("response ${response.result}");

      if (response.response?.responseCode == 0) {
        Get.bottomSheet(BottomSheetCustom(
          message: '${response.response?.responseMessage}',
          title: "Forgot Password!",
          btnText: "Login",
          isBack: true,
          navigationBack: () {
            Get.back();
            Get.offAllNamed(AppRoute.login);
          },
        ));
        isLoading.value = false;
      } else {
        Get.bottomSheet(BottomSheetCustom(
            message: '${response.response?.responseMessage}'));
        isLoading.value = false;
      }
    }, onError: (error) {
      Get.bottomSheet(BottomSheetCustom(message: '$error'));
      isLoading.value = false;
    }).whenComplete(() {});
  }
}

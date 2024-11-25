import '../../helper/app_export.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ResetPasswordController>(ResetPasswordController());
  }
}

class ResetPasswordController extends GetxController {
  late ScrollController scrollController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  HomeController homeController = Get.find<HomeController>();

  var isSliverAppBarExpanded = false.obs;
  var newObscurePassword = true.obs;
  var confirmObscurePassword = true.obs;
  var isLoading = false.obs;

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void onInit() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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

  void changePasswordService() {
    isLoading.value = true;
    var parameters = {
      constCurrentPassword: "",
      constNewPassword: newPasswordController.text,
      constUserID: homeController.userInfo.info?.userId,
    };
    debugPrint("parameters $parameters");
    ApiProvider()
        .postObject(url: ApiProvider.changePassword, body: parameters)
        .then((onValue) async {
      var response = GeneralResponseModel.fromJson(onValue);

      debugPrint("response ${response.result}");

      if (response.response?.responseCode == 0) {
        homeController.userInfo.info?.isforgotPassword = false;
        homeController.box.write(
            constSignInModel, json.encode(homeController.userInfo).toString());
        Get.bottomSheet(BottomSheetCustom(
          message: '${response.response?.responseMessage}',
          title: "Reset Password!",
          isBack: true,
          navigationBack: () {
            Get.back();
            Get.offAllNamed(AppRoute.home);
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

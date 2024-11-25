import 'package:feroze_mills/helper/app_export.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  HomeController homeController = Get.find<HomeController>();

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  var obscurePassword = true.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // emailController.text = 'waseem.akram@codelabs.inc';
    // passwordController.text = 'admin1234';
    super.onInit();
  }

  void loginService() {
    isLoading.value = true;
    var parameters = {
      constEmail: emailController.text,
      constPassword: passwordController.text,
    };
    debugPrint("parameters $parameters");
    ApiProvider().postObject(url: ApiProvider.logIn, body: parameters).then(
        (onValue) async {
      var response = GeneralResponseModel<LoginResponseModel>.fromJson(onValue);

      debugPrint("response ${response.result}");

      if (response.response?.responseCode == 0) {
        homeController.userInfo = response.result!;

        homeController.box
            .write(constSignInModel, json.encode(response.result!).toString());

        if (homeController.userInfo.info!.isforgotPassword ?? false) {
          Get.toNamed(AppRoute.resetPassword);
          isLoading.value = false;
        } else {
          Get.offAllNamed(AppRoute.home);
        }
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

import '../../helper/app_export.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  int duration = 3;
  HomeController homeController = Get.find<HomeController>();
  LoginResponseModel userInfo = LoginResponseModel();
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    splashAnimation();
  }

  void splashAnimation() {
    if (box.read(constSignInModel) != null) {
      userInfo = LoginResponseModel.fromJson(
          json.decode(box.read(constSignInModel)!.toString()));
    }
    animationController = AnimationController(
      duration: Duration(seconds: duration),
      vsync: this,
    );
    animationController.forward().whenCompleteOrCancel(() {
      if (!homeController.box.hasData(constSignInModel) ||
          userInfo.info == null) {
        Get.offAllNamed(AppRoute.login);
      } else {
        if (userInfo.info?.isforgotPassword ?? false) {
          Get.offAllNamed(AppRoute.login);
        } else {
          Get.offAllNamed(AppRoute.home);
        }
      }
    });
  }
}

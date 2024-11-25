import '../../helper/app_export.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChangePasswordController>(ChangePasswordController());
  }
}

class ChangePasswordController extends GetxController {
  late ScrollController scrollController;
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  HomeController homeController = Get.find<HomeController>();

  var isSliverAppBarExpanded = false.obs;
  var currentObscurePassword = true.obs;
  var newObscurePassword = true.obs;
  var confirmObscurePassword = true.obs;
  var isLoading = false.obs;

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void onInit() {
    currentPasswordController = TextEditingController();
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
      constCurrentPassword: currentPasswordController.text,
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
        Get.bottomSheet(BottomSheetCustom(
          message: '${response.response?.responseMessage}',
          title: "Password Chenged!",
          isBack: true,
          navigationBack: () {
            Get.back();
            Get.back();
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

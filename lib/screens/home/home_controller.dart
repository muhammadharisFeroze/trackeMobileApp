import '../../helper/app_export.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}

class HomeController extends GetxController {
  late TextEditingController inquiryController;
  late TextEditingController poController;
  late TextEditingController orderSheetController;

  LoginResponseModel userInfo = LoginResponseModel();
  final box = GetStorage();

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  var isLoading = false.obs;
  var isInquiry = false.obs;
  var isPO = false.obs;
  var isOrderSheet = false.obs;
  var isInquiryLoading = false.obs;
  var isPOLoading = false.obs;
  var isOrderSheetLoading = false.obs;
  var number = "".obs;

  var orderDataList = <OrderData>[].obs;
  var searchList = <OrderData>[].obs;
  var selectedItem = OrderData().obs;
  var selectedScanType = ScanType.none.index.obs;
  var isScanSearch = false.obs;

  @override
  void onInit() {
    inquiryController = TextEditingController();
    poController = TextEditingController();
    orderSheetController = TextEditingController();
    // inquiryController.text = '60184';
    // poController.text = '7375355205';
    // orderSheetController.text = '351241';
    if (box.read(constSignInModel) != null) {
      userInfo = LoginResponseModel.fromJson(
          json.decode(box.read(constSignInModel)!.toString()));
    }
    super.onInit();
  }

  void inquirySearch({String scanCode = ""}) {
    selectedItem.value = OrderData();
    isInquiry.value = false;
    isInquiryLoading.value = true;
    selectedScanType = ScanType.inquiry.index.obs;
    Get.toNamed(AppRoute.inquiryDetails);
    isInquiryLoading.value = false;
    number.value = scanCode.isEmpty ? inquiryController.text : scanCode;
    inquiryController.text = '';
  }

  void poSearch({String scanCode = ""}) {
    selectedItem.value = OrderData();
    isPO.value = false;
    isPOLoading.value = true;
    selectedScanType = ScanType.purchaseOrder.index.obs;
    isPOLoading.value = false;
    number.value = scanCode.isEmpty ? poController.text : scanCode;
    poController.text = '';
  }

  void orderSheetSearch({String scanCode = ""}) {
    selectedItem.value = OrderData();
    isOrderSheet.value = false;
    isOrderSheetLoading.value = true;
    selectedScanType = ScanType.orderSheet.index.obs;
    Get.toNamed(AppRoute.inquiryDetails);
    isOrderSheetLoading.value = false;
    number.value = scanCode.isEmpty ? orderSheetController.text : scanCode;
    orderSheetController.text = '';
  }

  void logOut() {
    selectedItem.value = OrderData();
    isLoading.value = true;
    Get.find<HomeController>().box.remove(constSignInModel);
    Future.delayed(const Duration(seconds: 1), () async {
      Get.offAllNamed(AppRoute.login);
      isLoading.value = false;
    });
  }
}

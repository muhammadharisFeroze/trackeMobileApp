import 'package:feroze_mills/helper/app_export.dart';

class LotReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LotReportsController>(LotReportsController());
  }
}

class LotReportsController extends GetxController {
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(scrollListener);
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
}

  import 'package:feroze_mills/helper/app_export.dart';

class WeavingIssueAndRecievedBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<WeavingIssueAndRecievedController>(
        WeavingIssueAndRecievedController());
  }
}

class WeavingIssueAndRecievedController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  WeavingController weavingController = Get.find<WeavingController>();

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

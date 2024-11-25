import '../../../helper/app_export.dart';

class DyeingIssueAndRecievedBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<DyeingIssueAndRecievedController>(
        DyeingIssueAndRecievedController());
  }
}

class DyeingIssueAndRecievedController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  DyeingController dyeingController = Get.find<DyeingController>();

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

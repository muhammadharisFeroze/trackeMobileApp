// import 'package:feroze_mills/helper/app_export.dart';

// class WeavingBindings implements Bindings {
//   @override
//   void dependencies() {
//     Get.put<WeavingController>(WeavingController());
//   }
// }

// class WeavingController extends GetxController {
//   HomeController homeController = Get.find<HomeController>();
//   late ScrollController scrollController;
//   var isSliverAppBarExpanded = false.obs;
//   var weaverIssueReceivedList = <WeaverIssueReceived>[].obs;
//   var isLoading = false.obs;
//   var weavingList = <WeavingData>[].obs;
//   WeavingData weavingData = WeavingData();

//   @override
//   void onInit() {
//     scrollController = ScrollController()..addListener(scrollListener);
//     getWeavingDataService();
//     super.onInit();
//   }

//   void scrollListener() {
//     // if (scrollController.hasClients &&
//     //     scrollController.offset > (GlobalValues.silverMoreScroll)) {
//     //   isSliverAppBarExpanded.value = true;
//     // } else {
//     //   isSliverAppBarExpanded.value = false;
//     // }
//   }

//   void getWeavingDataService({bool isLoding = true}) {
//     isLoading.value = isLoding;
//     print('Inquiry Number ${homeController.selectedItem.value.inquiryNo}');
//     ApiProvider()
//         .get(
//             url:
// /*
//                 "${ApiProvider.getWeavingData}?$constUserID=${homeController.userInfo.info!.userId}&$constInquiryNo=${homeController.selectedItem.value.osNo ?? ""}")
// */

//             "${ApiProvider.getWeavingData}?$constUserID=${homeController.userInfo.info!.userId}&$constInquiryNo=${homeController.selectedItem.value.inquiryNo ?? ""}") //change osNo to inquiryNo

//         .then((onValue) async {
//       var response =
//           GeneralResponseModel<WeavingdataResponseModel>.fromJson(onValue);

//       debugPrint("response ${response.result}");

//       if (response.response?.responseCode == 0 && response.result != null) {
//         weavingList.addAll(response.result?.weavingdata ?? []);
//         // getOrderStatusService(isLoding: false);
//       } else {
//         Get.bottomSheet(BottomSheetCustom(
//           message: '${response.response?.responseMessage}',
//           isBack: true,
//           navigationBack: () {
//             Get.back();
//             Get.back();
//           },
//         ));
//       }
//     }, onError: (error) {
//       Get.bottomSheet(BottomSheetCustom(
//         message: '$error',
//         isBack: true,
//         navigationBack: () {
//           Get.back();
//           Get.back();
//         },
//       ));
//     }).whenComplete(() {
//       isLoading.value = false;
//     });
//   }
// }

import 'package:feroze_mills/helper/app_export.dart';

class WeavingBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<WeavingController>(WeavingController());
  }
}

class WeavingController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  var weaverIssueReceivedList = <WeaverIssueReceived>[].obs;
  var isLoading = false.obs;
  var weavingList = <WeavingData>[].obs;
  WeavingData weavingData = WeavingData();

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(scrollListener);
    getWeavingDataService();
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

  void getWeavingDataService({bool isLoding = true}) {
    isLoading.value = isLoding;
    ApiProvider()
        .get(
            url:
               // "${ApiProvider.getWeavingData}?$constUserID=${homeController.userInfo.info!.userId}&$constInquiryNo=${homeController.selectedItem.value.osNo ?? ""}"
                "https://traceability.feroze1888.com:6023/api/TraceMain/GetWeavingData?InquiryNo=${homeController.selectedItem.value.inquiryNo?? ""}"
                
                )
        .then((onValue) async {
      var response =
          GeneralResponseModel<WeavingdataResponseModel>.fromJson(onValue);

      debugPrint("response ${response.result}");

      if (response.response?.responseCode == 0 && response.result != null) {
        weavingList.addAll(response.result?.weavingdata ?? []);
        // getOrderStatusService(isLoding: false);
      } else {
        Get.bottomSheet(BottomSheetCustom(
          message: '${response.response?.responseMessage}',
          isBack: true,
          navigationBack: () {
            Get.back();
            Get.back();
          },
        ));
      }
    }, onError: (error) {
      Get.bottomSheet(BottomSheetCustom(
        message: '$error',
        isBack: true,
        navigationBack: () {
          Get.back();
          Get.back();
        },
      ));
    }).whenComplete(() {
      isLoading.value = false;
    });
  }
}

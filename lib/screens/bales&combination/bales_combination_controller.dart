import 'package:feroze_mills/helper/app_export.dart';
import 'package:feroze_mills/screens/bales&combination/bales_combination_data_response_model.dart';

class BalesBindings implements Bindings {
  @override
  void dependencies() {
    //Get.lazyPut(() => BalesCombinationCOntroller());
    Get.put<BalesCombinationCOntroller>(BalesCombinationCOntroller());
  }
}

class BalesCombinationCOntroller extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late ScrollController scrollController;
  final box = GetStorage();

  BalesCombinationCOntroller balescombinationController =
      Get.find<BalesCombinationCOntroller>();

  //BalesCombinationController balesCombinationController = Get.find();
  var isSliverAppBarExpanded = false.obs;

  var isLoading = false.obs;

  var balesListing = <Bales>[].obs; //spinningList
  var balesDataListing = <DataListing>[].obs;
  DataListing balesData = DataListing();

  @override
  onInit() {
    scrollController = ScrollController()..addListener(scrollListener);
    getBalesDataService();
    // print("arguuuuuuuuuuuuuuuuuu " + Get.arguments.toString());
    // spinningDataList = Get.arguments;
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

  Future getBalesDataService({bool isLoding = true}) async {
    isLoading.value = isLoding;
    print('bccfolioooooooooooooooo ${box.read('bccFolio_value')}');
    String bccFolioNumb = box.read('bccFolio_value');
    await ApiProvider()
        .get(
            url:
                // 'https://traceability.feroze1888.com:6023/api/TraceMain/GetSpinningDetailByfolioNo?bccfolioNo=$bccFolioNumb'
                "${ApiProvider.getSpinningData}?$constUserID=${homeController.userInfo.info!.userId}&$constInquiryNo=$bccFolioNumb")
        .then((onValue) {
      // print('spinning response onvalue: ${onValue['result']}');
      // var response =
      // GeneralResponseModel<SpinningData>.fromJson(onValue);
      // SpinningData.fromJson(onValue);

      // if (response.response?.responseCode == 0 && response.result != null) {
      if (onValue['response']['responseCode'] == 0 &&
          onValue['result'] != null) {
        print('condition is true');
        balesDataListing = RxList<DataListing>.of(
            List.from(onValue['result']['dataList']).map<DataListing>((e) {
          return DataListing.fromJson(e);
        }).toList());

        // spinningList.add(response);
        // print(
        //     'spinning response success  ${spinningList[0].result!.dataList[0].inquiryNo}');

        // spinningList.addAll(response.result?.weavingdata ?? []);
        // getOrderStatusService(isLoding: false);
      } else {
        Get.bottomSheet(BottomSheetCustom(
          // message: '${response.response?.responseMessage}',
          message: '${onValue['response']['responseMessage']}',
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

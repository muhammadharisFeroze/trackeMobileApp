import 'package:feroze_mills/helper/app_export.dart';
import 'package:feroze_mills/screens/bales&combination/bales_combination_data_response_model.dart';

// ignore: must_be_immutable
class BalesScreen extends StatefulWidget {
  BalesScreen({super.key, required this.bccFolineNumber});
  int bccFolineNumber;

  @override
  State<BalesScreen> createState() => _BalesScreenState();
}

class _BalesScreenState extends State<BalesScreen> {
  bool isLoading = false;
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  HomeController homeController = Get.find<HomeController>();

  void scrollListener() {
 
  }

  var balesListing = <Bales>[].obs; //spinningList
  var balesDataListing = <DataListing>[].obs;
  DataListing balesData = DataListing();
  // final box = GetStorage();

  ///
  void getBalesDataService() {
    setState(() {
      isLoading = true;
    });

    print('bccfolioooooooooooooooo ${widget.bccFolineNumber}');

    ApiProvider()
        .get(
            url:
                'https://traceability.feroze1888.com:6023/api/TraceMain/GetSpinningDetailByfolioNo?bccfolioNo=${widget.bccFolineNumber}')
        // "${ApiProvider.getBalesData}?$constUserID=${homeController.userInfo.info!.userId}&$constInquiryNo=$bccFolioNumb")
        .then((onValue) {
      if (onValue['response']['responseCode'] == 0 &&
          onValue['result'] != null) {
        balesDataListing = RxList<DataListing>.of(
            List.from(onValue['result']['dataList']).map<DataListing>((e) {
          return DataListing.fromJson(e);
        }).toList());
      } else {
        Get.bottomSheet(BottomSheetCustom(
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
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController()..addListener(scrollListener);
    getBalesDataService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      CustomScrollView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        slivers: [
          AppbarWidget(
            isSliverAppBarExpanded: isSliverAppBarExpanded.value,
            appBarTitle: 'Bales Combination',
            isMoreCustom: true,
            name: homeController.selectedItem.value.custName ?? "",
            //name: selectedItem.value.custName,
            message: "${(balesDataListing.length)} Entries",
            inquiryDetail:
                "Inquiry: ${homeController.selectedItem.value.inquiryNo??""}",
          ),
          SliverPadding(
              padding: UIhelper.paddingHelper(context,
                  top: 20, bottom: 20, right: 20, left: 20),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      var bitem = balesDataListing[index];
                      // var item = controller.balesList[index];
                      return Container(
                          padding: UIhelper.paddingHelper(context,
                              top: 10, bottom: 10, right: 10, left: 10),
                          decoration: UIhelper.rsoundedBorderFill(context),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExpnadedRowWidget(
                                    titleLeft: 'Lot No',
                                    descLeft: bitem.lotNo.toString(),
                                    titleRight: 'Station Name',
                                    descRight: bitem.stationName.toString()),
                                SizedBox(
                                  height: getVerticalSize(context, 15),
                                ),
                                ExpnadedRowWidget(
                                    titleLeft: 'Ginner Name',
                                    descLeft: bitem.ginnerName.toString(),
                                    titleRight: '',
                                    descRight: ''),
                                SizedBox(
                                  height: getVerticalSize(context, 5),
                                ),
                                //  item.weaverIssueReceived!.isNotEmpty
                                //  ? TextButtonWidget(onPressed: () {

                                //      })
                                //: Container(),
                              ]));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: getVerticalSize(context, 10),
                      );
                    },
                    itemCount: balesDataListing.length),
              ]))),
        ],
      ),
      isLoading ? const ScreenLoadingWidget() : Container()
      //isLoading.value ? const ScreenLoadingWidget() : Container()
    ]));
  }
}

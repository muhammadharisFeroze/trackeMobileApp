import 'package:feroze_mills/helper/app_export.dart';
import 'package:feroze_mills/screens/spinning/spinning_data_response_model.dart';

// ignore: must_be_immutable
class Spin extends StatefulWidget {
  Spin({required this.inqu, super.key});
  String inqu;

  @override
  State<Spin> createState() => _SpinState();
}

class _SpinState extends State<Spin> {
  bool isLoading = false;
  late ScrollController scrollController;

  var isSliverAppBarExpanded = false.obs;

  HomeController homeController = Get.find<HomeController>();
  void scrollListener() {
  
  }
  var spinningList = <SpinningData>[].obs;
  var spinningDataList = <DataList>[].obs;
  DataList spinningData = DataList();

  void getSpin() {
    setState(() {
      isLoading = true;
    });

    print('Inquiry Number ${widget.inqu}');

    ApiProvider()
        .get(
            url:
             
                'https://traceability.feroze1888.com:6023/api/TraceMain/GetSpinningByInquiry?inquiryNo=${widget.inqu}')
       .then((onValue) {
      if (onValue['response']['responseCode'] == 0 &&
          onValue['result'] != null) {
        spinningDataList = RxList<DataList>.of(
            List.from(onValue['result']['dataList']).map<DataList>((e) {
          return DataList.fromJson(e);
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

    scrollController = ScrollController()..addListener(scrollListener);
    getSpin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Obx(() {
        return Stack(
          children: [
            CustomScrollView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              slivers: [
                AppbarWidget(
                  isSliverAppBarExpanded: isSliverAppBarExpanded.value,
                  appBarTitle: "Spinning Details",
                  isMoreCustom: true,
                  name: homeController.selectedItem.value.custName?? "",
                  message: "${spinningDataList.length} Entries",
                  inquiryDetail:
                      // inquiryDetail:
                      "Inquiry: ${homeController.selectedItem.value.inquiryNo ?? ""}",
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
                        itemCount: spinningDataList.length,
                        itemBuilder: (context, index) {
                          var item = spinningDataList[index];
                          return Container(
                              padding: UIhelper.paddingHelper(context,
                                  top: 10, bottom: 10, right: 10, left: 10),
                              decoration: UIhelper.rsoundedBorderFill(context),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ExpnadedRowWidget(
                                        titleLeft: "Lot No",
                                        descLeft: item.lotNo!,
                                        titleRight: "Date",
                                        //   descRight: item.yarnMkdt.toString()),
                                        descRight:
                                            '${item.yarnMkdt!.year}-${item.yarnMkdt!.month}-${item.yarnMkdt!.day}'
                                      

                                        ),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),

                                    ExpnadedRowWidget(
                                        titleLeft: "BCCFOLIO",
                                        descLeft: item.bccFolio.toString(),
                                        titleRight: "Weaving Location",
                                        descRight:
                                            item.weavingLocation.toString()),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    ExpnadedRowWidget(
                                        titleLeft: "Yarn Source",
                                        descLeft: item.fcStatus.toString(),
                                        titleRight: "Yarn Description",
                                        descRight: item.yarnDesc.toString()),

                                    SizedBox(
                                      height: getVerticalSize(context, 5),
                                    ),
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          spinningData = item;
                                          print('BCCFOLIO ${item.bccFolio}');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BalesScreen(
                                                        bccFolineNumber: item.bccFolio?? 0),
                                              ));
                                      
                                        },
                                        child: const Text(
                                            "View Bales Combination >"),
                                      ),
                                    )
                                
                                  ]));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: getVerticalSize(context, 10),
                          );
                        },
                      ),
                    ]))),
              ],
            ),
            isLoading ? const ScreenLoadingWidget() : Container()
          ],
        );
      }),
    );
  }
}

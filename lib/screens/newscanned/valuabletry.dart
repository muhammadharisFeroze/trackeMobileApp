import 'package:feroze_mills/helper/app_export.dart';
import 'package:feroze_mills/screens/newscanned/scanned_dataresponse.dart';

// ignore: must_be_immutable
class valuable extends StatefulWidget {
  valuable({super.key, required this.dululu});
  String dululu;

  @override
  State<valuable> createState() => _valuableState();
}

class _valuableState extends State<valuable> {
  bool isLoading = false;
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  HomeController homeController = Get.find<HomeController>();

  void scrollListener() {
    // if (scrollController.hasClients &&
    //     scrollController.offset > (GlobalValues.silverMoreScroll)) {
    //   isSliverAppBarExpanded.value = true;
    // } else {
    //   isSliverAppBarExpanded.value = false;
    // }
  }
  //////////////////
  ///
  var valuablelisting = <ApiResponse>[].obs; //spinningList
  var valuabledatalisting = <TracespnDetail>[].obs;
  TracespnDetail tracespnDetail = TracespnDetail();
  var valuableinquirylisting = <InquiryDetail>[].obs;
  InquiryDetail inquiryDetail = InquiryDetail();
  // final box = GetStorage();

  ///
  Future getValuableDataService() async {
    setState(() {
      isLoading = true;
    });

    ApiProvider()
        .get(
            url:
                'https://traceability.feroze1888.com:6023/api/TraceMain/GetSpinningDetailByLotNo?lotNO=${widget.dululu}')
        .then((value) {
      if (value['response']['responseCode'] == 0 && value['result'] != null) {
        valuabledatalisting = RxList<TracespnDetail>.of(
            List.from(value['response']['dataList']).map((e) {
          return TracespnDetail.fromJson(e);
        }).toList());
      } else {
        Get.bottomSheet(BottomSheetCustom(
          message: '${value['response']['responseMessage']}',
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
    getValuableDataService();
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
                      var bitem = valuabledatalisting[index];
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
                              ]));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: getVerticalSize(context, 10),
                      );
                    },
                    itemCount: valuabledatalisting.length),
              ]))),
        ],
      ),
      isLoading ? const ScreenLoadingWidget() : Container()
      //isLoading.value ? const ScreenLoadingWidget() : Container()
    ]));
  }
}



import 'package:feroze_mills/screens/weaving/weaving_issued.dart';

import '../../helper/app_export.dart';

class NewWeavingView extends StatefulWidget {
  final String inquiryNo;
  final String custName;
  const NewWeavingView({Key? key, required this.inquiryNo, required this.custName}) : super(key: key);

  @override
  _NewWeavingViewState createState() => _NewWeavingViewState();
}

class _NewWeavingViewState extends State<NewWeavingView> {
  List<WeavingData> weavingList = [];
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  bool isSliverAppBarExpanded = false;
  String? custName;
  String inquiryNo = '';

  @override
  void initState() {
    super.initState();


        inquiryNo =widget.inquiryNo;
        custName = widget.custName;
        getWeavingDataService(inquiryNo: inquiryNo);

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        setState(() {
          isSliverAppBarExpanded = true;
        });
      } else {
        setState(() {
          isSliverAppBarExpanded = false;
        });
      }
    });
  }

  void getWeavingDataService({required String inquiryNo, bool isLoding = true}) {
    setState(() {
      isLoading = isLoding;
    });

    ApiProvider().get(
      url: "${ApiProvider.getWeavingData}?$constUserID=${homeController.userInfo.info?.userId}&$constInquiryNo=$inquiryNo",
    ).then((onValue) async {
      var response = GeneralResponseModel<WeavingdataResponseModel>.fromJson(onValue);

      if (response.response?.responseCode == 0 && response.result != null) {
        setState(() {
          weavingList.addAll(response.result?.weavingdata ?? []);
        });
      } else {
        showError(response.response?.responseMessage);
      }
    }).catchError((error) {
      showError('$error');
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  void showError(String? message) {
    Get.bottomSheet(BottomSheetCustom(
      message: message ?? 'Error occurred',
      isBack: true,
      navigationBack: () {
        Get.back();
        Get.back();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Stack(
        children: [
          CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            slivers: [
              AppbarWidget(
                isSliverAppBarExpanded: isSliverAppBarExpanded,
                appBarTitle: 'Weaving Details',
                isMoreCustom: true,
                name: custName ?? "",
                message: "${weavingList.length} Entries",
                inquiryDetail: "Inquiry: $inquiryNo",
              ),
              SliverPadding(
                padding: UIhelper.paddingHelper(context, top: 20, bottom: 20, right: 20, left: 20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var item = weavingList[index];
                        return Container(
                          padding: UIhelper.paddingHelper(context, top: 10, bottom: 10, right: 10, left: 10),
                          decoration: UIhelper.rsoundedBorderFill(context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ExpnadedRowWidget(
                                titleLeft: "Quality Code",
                                descLeft: item.qualityCode ?? "",
                                titleRight: "Weaver PO",
                                descRight: "${item.weaverPo ?? ""}",
                              ),
                              SizedBox(height: getVerticalSize(context, 15)),
                              ExpnadedRowWidget(
                                titleLeft: "Weaver Order No.",
                                descLeft: "${item.woNo ?? ""}",
                                titleRight: "Factory Inquiry",
                                descRight: "${item.factoryInquiry ?? ""}",
                              ),
                              SizedBox(height: getVerticalSize(context, 15)),
                              TitelDescWidget(
                                title: "Weaver Name",
                                desc: item.weaverName ?? "",
                              ),
                              SizedBox(height: getVerticalSize(context, 5)),
                              item.weaverIssueReceived!.isNotEmpty
                                  ? TextButtonWidget(onPressed: () {
                                // Navigate to weavingIssuedAndReceived
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewWeavingIssueAndReceivedView(
                                      weaverIssueReceived: item.weaverIssueReceived!,
                                    ),
                                  ),
                                );
                              })
                                  : Container(),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: getVerticalSize(context, 10));
                      },
                      itemCount: weavingList.length,
                    ),
                  ]),
                ),
              ),
            ],
          ),
          isLoading ? const ScreenLoadingWidget() : Container(),
        ],
      ),
    );
  }
}

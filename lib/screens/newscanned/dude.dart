

import 'package:feroze_mills/helper/app_export.dart';
import 'package:feroze_mills/screens/newscanned/scanned_dataresponse.dart';
import 'package:http/http.dart' as http;


class Dude extends StatefulWidget {
  Dude({required this.dululu, super.key});
  final String dululu;

  @override
  State<Dude> createState() => _DudeState();
}

class _DudeState extends State<Dude> {
  late Future<ApiResponse?> _future;
  List<InquiryDetail>? _inquiryDetails;
  bool _isLoading = true; // Track loading state
  List<TracespnDetail>? _details;

  @override
  void initState() {
    _future = value();
    super.initState();
  }

  Future<ApiResponse> value() async {
    setState(() {
      _isLoading = true;
    });

    final url =
        'https://traceability.feroze1888.com:6023/api/TraceMain/GetSpinningDetailByLotNo?lotNO=${widget.dululu}';

    try {
      final response = await http.get(Uri.parse(url));
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (data['response']['responseCode'] == 0 && data['result'] != null) {
          setState(() {
            _inquiryDetails = ApiResponse.fromJson(data).result?.inquiryDetails;
            _details = ApiResponse.fromJson(data).result?.tracespnDetails;
            _isLoading = false;
          });
          return ApiResponse.fromJson(data);
        } else {
          Get.bottomSheet(BottomSheetCustom(
            message: '${data['response']['responseMessage']}',
            isBack: true,
            navigationBack: () {
              Get.back();
              Get.back();
            },
          ));
          setState(() {
            _isLoading = false;
          });
          throw 'Failed to load data';
        }
      } else {
        throw 'Failed to load data';
      }
    } catch (error) {
      Get.bottomSheet(BottomSheetCustom(
        message: '$error',
        isBack: true,
        navigationBack: () {
          Get.back();
          Get.back();
        },
      ));
      setState(() {
        _isLoading = false;
      });
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        body: _isLoading
            ? const ScreenLoadingWidget() // Show loading screen if loading
            : Column(
                children: [
                  Container(
                    padding: UIhelper.paddingHelper(context,
                        top: 0, bottom: 20, right: 20, left: 20),
                    decoration: BoxDecoration(
                      color: ColorConstant.blueGray,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(getSize(context, 22)),
                        bottomRight: Radius.circular(getSize(context, 22)),
                      ),
                      gradient: LinearGradient(
                          begin: const Alignment(0, .7),
                          end: const Alignment(0, 1),
                          stops: const [
                            .5,
                            1.0
                          ],
                          colors: [
                            ColorConstant.blueGray,
                            ColorConstant.gray300,
                          ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Bales Combination",
                            style: AppStyle.txtRobotoRomanExtraBold24(context),
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(context, 15),
                        ),
                        _inquiryDetails == null || _inquiryDetails!.isEmpty
                            ? ScreenLoadingWidget()
                            : Container(
                                padding: UIhelper.paddingHelper(context,
                                    top: 8, bottom: 8, right: 10, left: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      getSize(context, 8)),
                                  color: ColorConstant.lime700,
                                ),
                                // ignore: prefer_const_constructors
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                ColorConstant.indigo800,
                                            radius:
                                                getHorizontalSize(context, 22),
                                            child: SvgPicture.asset(
                                                AssetsConstant.userAvtar),
                                          ),
                                          SizedBox(
                                            width:
                                                getHorizontalSize(context, 5),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              /*  _inquiryDetails != null &&
                                            _inquiryDetails!.isNotEmpty
                                        ?*/
                                              Row(
                                                children: [
                                                  Text(
                                                    _inquiryDetails![0]
                                                            .custName ??
                                                        'No Customer Name',
                                                    style: AppStyle
                                                            .txtRobotoRegular16(
                                                                context)
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .whiteA700),
                                                  ),
                                                  const SizedBox(
                                                    width: 50.0,
                                                  ),
                                                  Text(
                                                    "Inquiry ${_inquiryDetails![0].factoryInquiry}",
                                                    style: AppStyle
                                                            .txtRobotoRegular16(
                                                                context)
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .whiteA700),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height:
                                                    getVerticalSize(context, 5),
                                              ),
                                              Text(
                                                "Entries ${_details?.length.toString() ?? '0'}",
                                                style:
                                                    AppStyle.txtRobotoRegular16(
                                                            context)
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .whiteA700),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ]))
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<ApiResponse?>(
                      future: _future, // Use _future here
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const ScreenLoadingWidget();
                        } else if (snapshot.hasError || snapshot.data == null) {
                          return const ScreenLoadingWidget();
                        } else {
                          var tracespnDetails =
                              snapshot.data!.result!.tracespnDetails;
                          return ListView.builder(
                            itemCount: tracespnDetails.length,
                            itemBuilder: (context, index) {
                              var detail = tracespnDetails[index];
                              return Padding(
                                padding: UIhelper.paddingHelper(context,
                                    top: 10, bottom: 10, right: 20, left: 20),
                                child: Container(
                                    padding: UIhelper.paddingHelper(context,
                                        top: 10,
                                        bottom: 10,
                                        right: 10,
                                        left: 10),
                                    decoration:
                                        UIhelper.rsoundedBorderFill(context),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ExpnadedRowWidget(
                                              titleLeft: 'Lot No',
                                              descLeft: detail.lotNo.toString(),
                                              titleRight: 'Station Name',
                                              descRight: detail.stationName
                                                  .toString()),
                                          SizedBox(
                                            height:
                                                getVerticalSize(context, 15),
                                          ),
                                          ExpnadedRowWidget(
                                              titleLeft: 'Ginner Name',
                                              descLeft:
                                                  detail.ginnerName.toString(),
                                              titleRight: '',
                                              descRight: ''),
                                          SizedBox(
                                            height: getVerticalSize(context, 5),
                                          ),
                                        ])),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}


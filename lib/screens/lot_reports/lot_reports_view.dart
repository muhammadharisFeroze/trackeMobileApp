// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import '../../helper/app_export.dart';

class LotReportsView extends GetView<LotReportsController> {
  Map<String, String> lotReport = {
    'Lot Number': '220212CPD-K3014R',
    'Dyed Fabric Received': '4,927.36 Kg',
    'Weight': '5,039.73 Kg',
    'Balance to Receive': '1,541.03 Kg',
  };

  @override
  Widget build(BuildContext context) {
    var lotReportList = lotReport.entries.toList();
    return
        //Main Widget of the page
        Scaffold(
      // backgroundColor: ColorConstant.whiteA700,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        controller: controller.scrollController,
        slivers: [
          Obx(() {
            return AppbarWidget(
              isSliverAppBarExpanded: controller.isSliverAppBarExpanded.value,
              appBarTitle: 'Lot Reports',
            );
          }),
          SliverPadding(
            padding: UIhelper.paddingHelper(context,
                top: 10, bottom: 0, right: 20, left: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: UIhelper.paddingHelper(context,
                            top: 9, bottom: 9, right: 11, left: 11),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(getSize(context, 8)),
                          color: ColorConstant.gray101,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 6,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        lotReportsTile(
                                            lotReportList, 0, context),
                                        SizedBox(
                                          height: getVerticalSize(context, 18),
                                        ),
                                        lotReportsTile(
                                            lotReportList, 1, context),
                                      ],
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        lotReportsTile(
                                            lotReportList, 2, context),
                                        SizedBox(
                                          height: getVerticalSize(context, 18),
                                        ),
                                        lotReportsTile(
                                            lotReportList, 3, context),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(context, 10),
                            ),
                            Divider(
                              thickness: getVerticalSize(context, 1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(AppRoute.lotReports);
                                  },
                                  child: Text(
                                    'Generate Reports >',
                                    style: AppStyle
                                        .txtRobotoRomanRegular16Indigo800(
                                            context),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: ((context, index) {
                      return SizedBox(
                        height: getVerticalSize(context, 13),
                      );
                    }),
                    itemCount: 5)
              ]),
            ),
          )
        ],
      ),
    );
  }

  Column lotReportsTile(List<MapEntry<String, String>> overviewList, int index,
      BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          overviewList[index].key,
          style: AppStyle.txtRobotoRomanRegular14(context),
        ),
        SizedBox(
          height: getVerticalSize(context, 5),
        ),
        Text(
          overviewList[index].value,
          style: AppStyle.txtRobotoRomanMedium16(context),
        ),
      ],
    );
  }
}

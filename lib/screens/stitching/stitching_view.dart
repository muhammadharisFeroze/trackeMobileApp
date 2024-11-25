// ignore_for_file: must_be_immutable

import '../../helper/app_export.dart';

class StitchingView extends GetView<StitchingController> {
  const StitchingView({super.key});

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
              controller: controller.scrollController,
              slivers: [
                AppbarWidget(
                  isSliverAppBarExpanded:
                      controller.isSliverAppBarExpanded.value,
                  appBarTitle: 'Stitching',
                  isMoreCustom: true,
                  name: controller.homeController.selectedItem.value.custName ??
                      "",
                  message: "${controller.stichingList.length} Entries",
                  inquiryDetail:
                      "Inquiry: ${controller.homeController.selectedItem.value.inquiryNo ?? ""}",
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
                          var item = controller.stichingList[index];
                          return Container(
                              padding: UIhelper.paddingHelper(context,
                                  top: 10, bottom: 10, right: 10, left: 10),
                              decoration: UIhelper.rsoundedBorderFill(context),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ExpnadedRowWidget(
                                        titleLeft: "Order Sheet No.",
                                        descLeft: "${item.osNo ?? ""}",
                                        titleRight: "Package Code",
                                        descRight: item.packageCode ?? ""),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    ExpnadedRowWidget(
                                        titleLeft: "Order Quantity",
                                        descLeft: "${item.orderQty ?? ""}",
                                        titleRight: "Audited Quantity",
                                        descRight:
                                            "${item.auditedQuantity ?? ""}"),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    ExpnadedRowWidget(
                                      titleLeft: "Stitching Start Date",
                                      descLeft: UIhelper.dateTimeFormat(
                                          item.stitchingStartDate ??
                                              DateTime.now(),
                                          format: "dd/MM/yyyy"),
                                      titleRight: "Last QC Passed Date",
                                      descRight: UIhelper.dateTimeFormat(
                                          item.lastQcPassedDate ??
                                              DateTime.now(),
                                          format: "dd/MM/yyyy"),
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    ExpnadedRowWidget(
                                        titleLeft: "Stitcher Name",
                                        descLeft: item.stitcherName ?? "",
                                        titleRight: "Balance to QC",
                                        descRight: "${item.balanceToQc ?? ""}"),
                                  ]));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: getVerticalSize(context, 10),
                          );
                        },
                        itemCount: controller.stichingList.length,
                      ),
                    ]))),
              ],
            ),
            controller.isLoading.value
                ? const ScreenLoadingWidget()
                : Container()
          ],
        );
      }),
    );
  }
}

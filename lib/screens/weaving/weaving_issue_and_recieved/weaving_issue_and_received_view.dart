import '../../../helper/app_export.dart';

class WeavingIssueAndRecievedView
    extends GetView<WeavingIssueAndRecievedController> {
  const WeavingIssueAndRecievedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            controller: controller.scrollController,
            slivers: [
              Obx(() {
                return AppbarWidget(
                  isSliverAppBarExpanded:
                      controller.isSliverAppBarExpanded.value,
                  appBarTitle: 'Weaving Issued & Received',
                  isMoreCustom: true,
                  name: controller.homeController.selectedItem.value.custName ??
                      "",
                  message:
                      "${controller.weavingController.weavingData.weaverPo ?? ""}",
                  inquiryDetail:
                      "Inquiry: ${controller.homeController.selectedItem.value.inquiryNo ?? ""}",
                );
              }),
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
                          var item = controller
                              .weavingController.weaverIssueReceivedList[index];
                          return Container(
                              padding: UIhelper.paddingHelper(context,
                                  top: 10, bottom: 10, right: 10, left: 10),
                              decoration: UIhelper.rsoundedBorderFill(context),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ExpnadedRowWidget(
                                        titleLeft: "Quality Code",
                                        descLeft: item.qualityCode ?? "",
                                        titleRight: "PO No.",
                                        descRight: "${item.poNo ?? ""}"),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    ExpnadedRowWidget(
                                        titleLeft: "PO Date",
                                        descLeft: UIhelper.dateTimeFormat(
                                            item.poDate ?? DateTime.now()),
                                        titleRight: "PO Time",
                                        descRight: item.poTime ?? ""),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    ExpnadedRowWidget(
                                        titleLeft: "PO Issued Qty",
                                        descLeft: "${item.poIssueQty ?? ""}",
                                        titleRight: "PO Received Qty",
                                        descRight:
                                            "${item.poReceivedQty ?? ""}"),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    TitelDescWidget(
                                        title: "Last Received Date",
                                        desc: UIhelper.dateTimeFormat(
                                            item.poLastReceivingDate ??
                                                DateTime.now(),
                                            format: "dd/MM/yyyy")),
                                  ]));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: getVerticalSize(context, 10),
                          );
                        },
                        itemCount: controller
                            .weavingController.weaverIssueReceivedList.length),
                  ]))),
            ]));
  }
}

import '../../../helper/app_export.dart';

class DyeingIssueAndRecievedView
    extends GetView<DyeingIssueAndRecievedController> {
  const DyeingIssueAndRecievedView({super.key});

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
                  appBarTitle: 'Dyeing Issued & Received',
                  isMoreCustom: true,
                  name: controller.homeController.selectedItem.value.custName ??
                      "",
                  message:
                      "${controller.dyeingController.dyeingData.dProgramNo}",
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
                            .dyeingController.dyeingIssueReceivedList[index];
                        return Container(
                            padding: UIhelper.paddingHelper(context,
                                top: 10, bottom: 10, right: 10, left: 10),
                            decoration: UIhelper.rsoundedBorderFill(context),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ExpnadedRowWidget(
                                      titleLeft: "Program No.",
                                      descLeft:
                                          "${controller.dyeingController.dyeingData.dProgramNo}",
                                      titleRight: "Quality Code",
                                      descRight: item.qualityCode ?? ""),
                                  SizedBox(
                                    height: getVerticalSize(context, 15),
                                  ),
                                  ExpnadedRowWidget(
                                      titleLeft: "Color Code",
                                      descLeft: item.oColorCode ?? "",
                                      titleRight: "Status",
                                      descRight: item.lotStatus ?? ""),
                                  SizedBox(
                                    height: getVerticalSize(context, 15),
                                  ),
                                  ExpnadedRowWidget(
                                      titleLeft: "Issued Weight",
                                      descLeft: "${item.issuedWeight} kg",
                                      titleRight: "Received Weight",
                                      descRight:
                                          "${item.receivedWeight ?? ""} kg"),
                                  SizedBox(
                                    height: getVerticalSize(context, 15),
                                  ),
                                  ExpnadedRowWidget(
                                    titleLeft: "Issued Date",
                                    descLeft: UIhelper.dateTimeFormat(
                                        item.lotIssuedDate ?? DateTime.now(),
                                        format: "dd/MM/yyyy"),
                                    titleRight: "Receiving Date",
                                    descRight: UIhelper.dateTimeFormat(
                                        item.lastReceivingDate ??
                                            DateTime.now(),
                                        format: "dd/MM/yyyy"),
                                  ),
                                ]));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: getVerticalSize(context, 10),
                        );
                      },
                      itemCount: controller
                          .dyeingController.dyeingIssueReceivedList.length,
                    ),
                  ]))),
            ]));
  }
}

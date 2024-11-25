// ignore_for_file: must_be_immutable

import '../../helper/app_export.dart';

class ShippingDetailsView extends GetView<ShippingDetailsController> {
  const ShippingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      resizeToAvoidBottomInset: false,
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
                  appBarTitle: 'Shipments',
                  isMoreCustom: true,
                  name: controller.homeController.selectedItem.value.custName ??
                      "",
                  message: "${controller.shipmentList.length} Shipments",
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
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: getVerticalSize(context, 10),
                            );
                          },
                          itemCount: controller.shipmentList.length,
                          itemBuilder: (context, index) {
                            var item = controller.shipmentList[index];
                            return Container(
                              padding: UIhelper.paddingHelper(context,
                                  top: 10, bottom: 10, right: 10, left: 10),
                              decoration: UIhelper.rsoundedBorderFill(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitelDescWidget(
                                      title: "DO no.", desc: item.doNo ?? ""),
                                  SizedBox(
                                    height: getVerticalSize(context, 15),
                                  ),
                                  ExpnadedRowWidget(
                                      titleLeft: "Buyer PO",
                                      descLeft: item.poNoBuyer ?? "",
                                      titleRight: "Ordersheet no.",
                                      descRight: "${item.os ?? ""}"),
                                  SizedBox(
                                    height: getVerticalSize(context, 15),
                                  ),
                                  ExpnadedRowWidget(
                                      titleLeft: "Container no.",
                                      descLeft: item.containerNo ?? "",
                                      titleRight: "Container Size",
                                      descRight: item.cSizeDesc ?? ""),
                                  SizedBox(
                                    height: getVerticalSize(context, 15),
                                  ),
                                  ExpnadedRowWidget(
                                    titleLeft: "Date out",
                                    descLeft: UIhelper.dateTimeFormat(
                                        item.dateOut ?? DateTime.now()),
                                    titleRight: "Shipped Cartons",
                                    descRight:
                                        "${item.quantityShippedInCartons ?? ""}",
                                  ),
                                  // UIhelper.dateTimeFormat(
                                  //     item.dateOut ?? DateTime.now(),
                                  //     format: "hh:mm:ss")),
                                  SizedBox(
                                    height: getVerticalSize(context, 15),
                                  ),
                                  ExpnadedRowWidget(
                                      titleLeft: "Local Port Name",
                                      descLeft: item.locPortName ?? "",
                                      titleRight: "",
                                      descRight: ""),
                                ],
                              ),
                            );
                          }),
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

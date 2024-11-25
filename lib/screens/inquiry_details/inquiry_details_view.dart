import 'package:feroze_mills/helper/app_export.dart';

class InquiryDetailsView extends GetView<InquiryDetailsController> {
  const InquiryDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.whiteA700,
      body: Obx(() {
        return Stack(
          children: [
            Padding(
              padding: UIhelper.paddingHelper(context, bottom: 70),
              child: CustomScrollView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  controller: controller.scrollController,
                  slivers: [
                    AppbarWidget(
                      isSliverAppBarExpanded:
                          controller.isSliverAppBarExpanded.value,
                      appBarTitle: 'Inquiry Details',
                      name: controller
                              .homeController.selectedItem.value.custName ??
                          "",
                      message:
                          "${controller.homeController.searchList.length} Purchase orders",
                      inquiryDetail:
                          "Inquiry: ${controller.homeController.selectedItem.value.inquiryNo ?? ""}",
                      isMoreCustom: true,
                    ),
                    SliverPadding(
                        padding: UIhelper.paddingHelper(context,
                            top: 10, bottom: 20, right: 20, left: 20),
                        sliver: SliverList(
                            delegate: SliverChildListDelegate([
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Purchase Orders',
                                style: AppStyle.txtRobotoRomanBold18(context),
                              ),
                              SizedBox(
                                height: getHorizontalSize(context, 10),
                              ),
                              SearchTextScanButtonWidget(
                                  textEditController:
                                      controller.searchTextController,
                                  hint: "Search Purchase Order",
                                  onChanged: (value) {
                                    UIhelper.capitalWords(
                                        controller.searchTextController, value);
                                    debugPrint("searchvalue $value");
                                    controller.search(value);
                                    debugPrint(
                                        "searchvalue ${controller.homeController.searchList.length}");
                                  },
                                  onPressed: () {
                                    controller.homeController.isScanSearch
                                        .value = true;
                                    controller.homeController.selectedScanType
                                        .value = ScanType.inquiry.index;
                                    Get.toNamed(AppRoute.qrScanner);
                                  }),
                              SizedBox(
                                height: getHorizontalSize(context, 10),
                              ),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var item = controller
                                      .homeController.searchList[index];
                                  return Container(
                                    padding: UIhelper.paddingHelper(context,
                                        top: 7, bottom: 7, right: 7, left: 7),
                                    decoration:
                                        UIhelper.roundedBorderLine(context),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: UIhelper.paddingHelper(
                                              context,
                                              top: 5,
                                              bottom: 5,
                                              right: 5,
                                              left: 5),
                                          child: ExpnadedRowWidget(
                                              titleLeft: "Customer PO",
                                              descLeft: item.customerPo ?? "",
                                              titleRight: "Buyer PO",
                                              descRight: item.poNoBuyer ?? ""),
                                        ),
                                        SizedBox(
                                          height:
                                              getHorizontalSize(context, 25),
                                        ),
                                        Container(
                                          padding: UIhelper.paddingHelper(
                                              context,
                                              top: 5,
                                              right: 5,
                                              bottom: 10,
                                              left: 5),
                                          decoration:
                                              UIhelper.rsoundedBorderFill(
                                                  context),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ExpnadedRowWidget(
                                                  titleLeft: "Colour Code",
                                                  descLeft:
                                                      item.oColorCode ?? "",
                                                  titleRight: "Order Sheet No.",
                                                  descRight:
                                                      "${item.osNo ?? ""}"),
                                              SizedBox(
                                                height: getHorizontalSize(
                                                    context, 15),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: TitelDescWidget(
                                                        title: "Package Code",
                                                        desc:
                                                            item.packageCode ??
                                                                ""),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: DefaultButtonWidget(
                                                      height: 35,
                                                      iconLeft: Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        color: ColorConstant
                                                            .whiteA700,
                                                        size: getSize(
                                                            context, 12),
                                                      ),
                                                      fontSize: 14,
                                                      buttonText:
                                                          "Open Details",
                                                      btnColor: ColorConstant
                                                          .indigo800,
                                                      borderRadius: 6,
                                                      onPressed: () {
                                                        controller
                                                            .homeController
                                                            .selectedItem
                                                            .value = item;
                                                        if (controller
                                                                .homeController
                                                                .selectedScanType
                                                                .value ==
                                                            ScanType.orderSheet
                                                                .index) {
                                                          Get.toNamed(AppRoute
                                                              .orderDetails);
                                                        } else {
                                                          Get.toNamed(AppRoute
                                                              .poDetails);
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // SizedBox(
                                              //   height: getHorizontalSize(
                                              //       context, 15),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount:
                                    controller.homeController.searchList.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: getHorizontalSize(context, 12),
                                  );
                                },
                              ),
                            ],
                          ),
                        ]))),
                  ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: ColorConstant.fromHex('#c39d3d29').withOpacity(.3),
                      spreadRadius: 0,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 5)
                ], color: ColorConstant.whiteA700),
                padding: UIhelper.paddingHelper(context,
                    top: 20, bottom: 20, right: 20, left: 20),
                child: DefaultButtonWidget(
                    buttonText: 'See Tree View',
                    btnColor: ColorConstant.indigo800,
                    onPressed: () {
                      Get.toNamed(AppRoute.tree);
                    }),
              ),
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

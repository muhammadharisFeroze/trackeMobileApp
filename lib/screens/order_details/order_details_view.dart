// ignore_for_file: must_be_immutable

import 'package:feroze_mills/helper/app_export.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstant.whiteA700,
      body: Obx(() {
        return SingleChildScrollView(
          child: AspectRatio(
            aspectRatio: size(context).aspectRatio + .00001,
            child: Stack(
              children: [
                CustomScrollView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    controller: controller.scrollController,
                    slivers: [
                      AppbarWidget(
                        isSliverAppBarExpanded:
                            controller.isSliverAppBarExpanded.value,
                        appBarTitle: 'Order Sheet Details', //'PO Details',
                        isMoreCustom: true,
                        name: controller
                                .homeController.selectedItem.value.custName ??
                            "",
                        message:
                            "${controller.homeController.selectedItem.value.osNo ?? ""}",
                        inquiryDetail:
                            "Inquiry: ${controller.homeController.selectedItem.value.inquiryNo ?? ""}",
                      ),
                      SliverPadding(
                          padding: UIhelper.paddingHelper(context,
                              top: 20, bottom: 20, right: 20, left: 20),
                          sliver: SliverList(
                              delegate: SliverChildListDelegate([
                            Container(
                              padding: UIhelper.paddingHelper(context,
                                  top: 5, bottom: 5, right: 5, left: 5),
                              decoration: UIhelper.roundedBorderLine(context),
                              child: Container(
                                padding: UIhelper.paddingHelper(context,
                                    top: 5, bottom: 5, right: 5, left: 5),
                                decoration:
                                    UIhelper.rsoundedBorderFill(context),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ExpnadedRowWidget(
                                        titleLeft: "Colour Code",
                                        descLeft: controller
                                                .homeController
                                                .selectedItem
                                                .value
                                                .oColorCode ??
                                            "",
                                        titleRight: "Order Sheet No.",
                                        descRight:
                                            "${controller.homeController.selectedItem.value.osNo ?? ""}"),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    ExpnadedRowWidget(
                                        titleLeft: "Package Code",
                                        descLeft: controller
                                                .homeController
                                                .selectedItem
                                                .value
                                                .packageCode ??
                                            "",
                                        titleRight: "Buyer Item No.",
                                        descRight: controller.homeController
                                                .selectedItem.value.poNoBuyer ??
                                            ""),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    TitelDescWidget(
                                        title: "Quality Codes",
                                        desc:
                                            "${controller.searchList.length}"),
                                    SizedBox(
                                      height: getVerticalSize(context, 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getVerticalSize(context, 25),
                            ),
                            Text(
                              'Quality Codes',
                              style: AppStyle.txtRobotoRomanBold18(context),
                            ),
                            SizedBox(
                              height: getVerticalSize(context, 15),
                            ),
                            SearchTextScanButtonWidget(
                                textEditController:
                                    controller.searchTextController,
                                hint: 'Search Quality Code',
                                onChanged: (value) {
                                  UIhelper.capitalWords(
                                      controller.searchTextController, value);
                                  debugPrint("searchvalue $value");
                                  controller.search(value);
                                },
                                onPressed: () {
                                  controller.homeController.isScanSearch.value =
                                      true;
                                  controller.homeController.selectedScanType
                                      .value = ScanType.orderSheet.index;
                                  Get.toNamed(AppRoute.qrScanner);
                                }),
                            SizedBox(
                              height: getVerticalSize(context, 10),
                            ),
                            Padding(
                              padding:
                                  UIhelper.paddingHelper(context, bottom: 150),
                              child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    var item = controller.searchList[index];
                                    return Container(
                                      padding:
                                          EdgeInsets.all(getSize(context, 7)),
                                      decoration:
                                          UIhelper.rsoundedBorderFill(context),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height:
                                                getVerticalSize(context, 10),
                                          ),
                                          Text(
                                            item.qualityCode ?? "0",
                                            style:
                                                AppStyle.txtRobotoRomanBold18(
                                                    context),
                                          ),
                                          SizedBox(
                                            height:
                                                getVerticalSize(context, 15),
                                          ),
                                          DetailsWidget(
                                              title: "Order Quantity",
                                              desc:
                                                  "${item.orderQuantity ?? 0}"),
                                          DetailsWidget(
                                            title: "Delivered Quantity",
                                            desc: "${item.deliveryQty ?? 0}",
                                            isDivider: false,
                                          ),
                                          SizedBox(
                                            height:
                                                getVerticalSize(context, 10),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: getVerticalSize(context, 10),
                                    );
                                  },
                                  itemCount: controller.searchList.length),
                            ),
                          ])))
                    ]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: ColorConstant.fromHex('#c39d3d29')
                              .withOpacity(.3),
                          spreadRadius: 0,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 10)
                    ], color: ColorConstant.whiteA700),
                    padding: UIhelper.paddingHelper(context,
                        top: 20, bottom: 20, right: 20, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              flex: 1,
                              child: DefaultButtonWidget(
                                  buttonText: 'Order Status',
                                  btnColor: ColorConstant.lime700,
                                  onPressed: () {
                                    Get.toNamed(AppRoute.orderStatus);
                                  }),
                            ),
                            SizedBox(
                              width: getHorizontalSize(context, 10),
                            ),
                            Flexible(
                                flex: 1,
                                child: DefaultButtonWidget(
                                    enable: (controller.homeController
                                                .selectedItem.value.shipments ??
                                            0) >
                                        0,
                                    buttonText:
                                        'Shipments (${controller.homeController.selectedItem.value.shipments ?? 0})', //'Shipments' // shipmenet count here ,
                                    btnColor: ColorConstant.blue400,
                                    onPressed: () {
                                      controller.homeController.selectedScanType
                                          .value = ScanType.orderSheet.index;
                                      Get.toNamed(AppRoute.shippingDetails);
                                    })),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(context, 20),
                        ),
                        DefaultButtonWidget(
                            buttonText: 'Tree View',
                            btnColor: ColorConstant.gray900,
                            onPressed: () {
                              Get.toNamed(AppRoute.tree);
                            }),
                      ],
                    ),
                  ),
                ),
                controller.isLoading.value
                    ? const ScreenLoadingWidget()
                    : Container()
              ],
            ),
          ),
        );
      }),
    );
  }
}

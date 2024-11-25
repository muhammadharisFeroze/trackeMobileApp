import 'package:feroze_mills/helper/app_export.dart';
import 'package:feroze_mills/screens/spinning/testingspinning.dart';

class OrderStatusView extends GetView<OrderStatusController> {
  const OrderStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: AspectRatio(
        aspectRatio: size(context).aspectRatio + .00001,
        child: Obx(() {
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
                      appBarTitle: 'Order Status',
                      isMoreCustom: true,
                      name: controller
                              .homeController.selectedItem.value.custName ??
                          "",
                      message:
                          "${(controller.statusesCount.value.weavingCount ?? 0) + (controller.statusesCount.value.dyeingCount ?? 0) + (controller.statusesCount.value.stichingCount ?? 0) + (controller.statusesCount.value.spinningCount ?? 0)} Entries",
                      inquiryDetail:
                          "Inquiry: ${controller.homeController.selectedItem.value.inquiryNo ?? ""}",
                    ),
                    SliverPadding(
                        padding: UIhelper.paddingHelper(context,
                            top: 20, bottom: 20, right: 20, left: 20),
                        sliver: SliverList(
                            delegate: SliverChildListDelegate([
                          //from here update 1 is started
                          InkWell(
                            onTap:
                                (controller.statusesCount.value.spinningCount ?? 0) >
                                        0
                                    ? () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Spin(
                                                  inqu: controller
                                                          .homeController
                                                          .selectedItem
                                                          .value
                                                          .inquiryNo ??
                                                      ""),
                                            ));
                                        // Get.toNamed(AppRoute.spinning);
                                      }
                                    : null,
                            highlightColor: ColorConstant.whiteA700,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: ColorConstant.lime700,
                                      radius: getHorizontalSize(context, 22),
                                      child: SvgPicture.asset(
                                        AssetsConstant.weavingLogo,
                                        height: getVerticalSize(context, 20),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getHorizontalSize(context, 5),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Spinning',
                                          style:
                                              AppStyle.txtRobotoRomanMedium16(
                                                  context),
                                        ),
                                        SizedBox(
                                          height: getVerticalSize(context, 5),
                                        ),
                                        Text(
                                          //"${(controller.statusesCount.value.stichingCount ?? 0)} Entries",
                                          "${(controller.statusesCount.value.spinningCount)} Entries  ",
                                          style: AppStyle
                                              .txtRobotoRomanRegular14Gray90087(
                                                  context),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: getSize(context, 15),
                                ),
                              ],
                            ),
                          ),
//End the first update here

                          Row(
                            children: [
                              SizedBox(width: getHorizontalSize(context, 21)),
                              Container(
                                height: getVerticalSize(context, 50),
                                width: getHorizontalSize(context, 2),
                                color: ColorConstant.black900.withOpacity(.1),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap:
                                (controller.statusesCount.value.weavingCount ??
                                            0) >
                                        0
                                    ? () {
                                        Get.toNamed(AppRoute.weaving);
                                      }
                                    : null,
                            highlightColor: ColorConstant.whiteA700,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: ColorConstant.indigo800,
                                      radius: getHorizontalSize(context, 22),
                                      child: SvgPicture.asset(
                                          AssetsConstant.weavingLogo),
                                    ),
                                    SizedBox(
                                      width: getHorizontalSize(context, 5),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Weaving',
                                          style:
                                              AppStyle.txtRobotoRomanMedium16(
                                                  context),
                                        ),
                                        SizedBox(
                                          height: getVerticalSize(context, 5),
                                        ),
                                        Text(
                                          "${(controller.statusesCount.value.weavingCount ?? 0)} Entries",
                                          style: AppStyle
                                              .txtRobotoRomanRegular14Gray90087(
                                                  context),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: getSize(context, 15),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(width: getHorizontalSize(context, 21)),
                              Container(
                                height: getVerticalSize(context, 50),
                                width: getHorizontalSize(context, 2),
                                color: ColorConstant.black900.withOpacity(.1),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap:
                                (controller.statusesCount.value.dyeingCount ??
                                            0) >
                                        0
                                    ? () {
                                        Get.toNamed(AppRoute.dyeing);
                                      }
                                    : null,
                            highlightColor: ColorConstant.whiteA700,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: ColorConstant.lime700,
                                      radius: getHorizontalSize(context, 22),
                                      child: SvgPicture.asset(
                                          AssetsConstant.dyingLogo),
                                    ),
                                    SizedBox(
                                      width: getHorizontalSize(context, 5),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dyeing',
                                          style:
                                              AppStyle.txtRobotoRomanMedium16(
                                                  context),
                                        ),
                                        SizedBox(
                                          height: getVerticalSize(context, 5),
                                        ),
                                        Text(
                                          "${(controller.statusesCount.value.dyeingCount ?? 0)} Entries",
                                          style: AppStyle
                                              .txtRobotoRomanRegular14Gray90087(
                                                  context),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: getSize(context, 15),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(width: getHorizontalSize(context, 21)),
                              Container(
                                height: getVerticalSize(context, 50),
                                width: getHorizontalSize(context, 2),
                                color: ColorConstant.black900.withOpacity(.1),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap:
                                (controller.statusesCount.value.stichingCount ??
                                            0) >
                                        0
                                    ? () {
                                        Get.toNamed(AppRoute.stitching);
                                      }
                                    : null,
                            highlightColor: ColorConstant.whiteA700,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: ColorConstant.gray102,
                                      radius: getHorizontalSize(context, 22),
                                      child: SvgPicture.asset(
                                        AssetsConstant.stitchingLogo,
                                        height: getVerticalSize(context, 20),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getHorizontalSize(context, 5),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Stitching',
                                          style:
                                              AppStyle.txtRobotoRomanMedium16(
                                                  context),
                                        ),
                                        SizedBox(
                                          height: getVerticalSize(context, 5),
                                        ),
                                        Text(
                                          "${(controller.statusesCount.value.stichingCount ?? 0)} Entries",
                                          style: AppStyle
                                              .txtRobotoRomanRegular14Gray90087(
                                                  context),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: getSize(context, 15),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(context, 53),
                          ),
                        ]))),
                  ]),
              controller.isLoading.value
                  ? const ScreenLoadingWidget()
                  : Container()
            ],
          );
        }),
      ),
    );
  }
}

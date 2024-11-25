import '../../helper/app_export.dart';

class TreeView extends GetView<TreeController> {
  const TreeView({super.key});

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
                  appBarTitle: 'Tree View',
                  isMoreCustom: true,
                  name: controller.homeController.selectedItem.value.custName ??
                      "",
                  message: "${controller.treeList.length} Purchase orders",
                  inquiryDetail:
                      "Inquiry: ${controller.homeController.selectedItem.value.inquiryNo ?? ""}",
                ),
                SliverPadding(
                    padding: UIhelper.paddingHelper(context,
                        top: 20, bottom: 20, right: 20, left: 20),
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
                          ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: getVerticalSize(context, 15),
                                );
                              },
                              itemCount: controller.treeList.length,
                              itemBuilder: (context, treeIndex) {
                                var poItem = controller.treeList[treeIndex];
                                return Column(
                                  children: [
                                    TreeItemWidget(
                                      title: "Purchase Order No.",
                                      desc: poItem.po ?? "",
                                      topSizeWidth: 0,
                                      isActive: true,
                                    ),
                                    ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: UIhelper.paddingHelper(context,
                                            top: 20),
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height:
                                                getVerticalSize(context, 10),
                                          );
                                        },
                                        itemCount:
                                            poItem.ordersheetnos?.length ?? 0,
                                        itemBuilder: (context, osIndex) {
                                          var osItem =
                                              poItem.ordersheetnos?[osIndex];
                                          int shipmentLength = poItem
                                                  .ordersheetnos?[osIndex]
                                                  .shipments
                                                  ?.length ??
                                              0;

                                          int qcLength = poItem
                                                  .ordersheetnos?[osIndex]
                                                  .qualityCodes
                                                  ?.length ??
                                              0;
                                          return Column(
                                            children: [
                                              TreeItemWidget(
                                                title: "Ordersheet No.",
                                                desc: "${osItem?.osNo ?? ""}",
                                              ),
                                              SizedBox(
                                                  height: getVerticalSize(
                                                      context,
                                                      (shipmentLength > 0)
                                                          ? 10
                                                          : 0)),
                                              (shipmentLength > 0)
                                                  ? TreeItemWidget(
                                                      title: "",
                                                      desc: "Shipments",
                                                      isActive:
                                                          (shipmentLength > 0),
                                                    )
                                                  : Container(),
                                              (shipmentLength > 0)
                                                  ? ListView.separated(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      padding: UIhelper
                                                          .paddingHelper(
                                                              context,
                                                              top: 10),
                                                      separatorBuilder:
                                                          (context, index) {
                                                        return SizedBox(
                                                          height:
                                                              getVerticalSize(
                                                                  context, 10),
                                                        );
                                                      },
                                                      itemCount: shipmentLength,
                                                      itemBuilder: (context,
                                                          shipmentIndex) {
                                                        var shipmentItem =
                                                            osItem?.shipments?[
                                                                shipmentIndex];
                                                        return TreeItemWidget(
                                                          title: "Do No.",
                                                          desc: shipmentItem
                                                                  ?.doNo ??
                                                              "",
                                                          isActive: false,
                                                          topSizeWidth: 60,
                                                        );
                                                      })
                                                  : Container(),

                                              SizedBox(
                                                  height: getVerticalSize(
                                                      context,
                                                      (qcLength > 0) ? 10 : 0)),
                                              (qcLength > 0)
                                                  ? TreeItemWidget(
                                                      title: "",
                                                      desc: "Quality Codes",
                                                      isActive: (qcLength > 0),
                                                    )
                                                  : Container(),
                                              (qcLength > 0)
                                                  ? ListView.separated(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      padding: UIhelper
                                                          .paddingHelper(
                                                              context,
                                                              top: 10),
                                                      separatorBuilder:
                                                          (context, index) {
                                                        return SizedBox(
                                                          height:
                                                              getVerticalSize(
                                                                  context, 10),
                                                        );
                                                      },
                                                      itemCount: qcLength,
                                                      itemBuilder:
                                                          (context, qcIndex) {
                                                        var qcItem = osItem
                                                                ?.qualityCodes?[
                                                            qcIndex];
                                                        return TreeItemWidget(
                                                          title: "Code",
                                                          desc: qcItem
                                                                  ?.qualityCode ??
                                                              "",
                                                          isActive: false,
                                                          topSizeWidth: 60,
                                                        );
                                                      })
                                                  : Container(),

                                              //           TreeItemWidget(
                                              //   title: index == 1
                                              //       ? ""
                                              //       : "Ordersheet No.",
                                              //   desc: index == 1
                                              //       ? "Shipments"
                                              //       : "352104",
                                              //   isActive: index == 1,
                                              // ),
                                              // index == 1
                                              //     ? ListView.separated(
                                              //         physics:
                                              //             const NeverScrollableScrollPhysics(),
                                              //         shrinkWrap: true,
                                              //         padding: UIhelper.paddingHelper(
                                              //             context,
                                              //             top: 20),
                                              //         separatorBuilder:
                                              //             (context, index) {
                                              //           return SizedBox(
                                              //             height: getVerticalSize(
                                              //                 context, 10),
                                              //           );
                                              //         },
                                              //         itemCount: 3,
                                              //         itemBuilder: (context, index) {
                                              //           return TreeItemWidget(
                                              //             title: "Do No.",
                                              //             desc: "54356",
                                              //             isActive: false,
                                              //             topSizeWidth: 60,
                                              //           );
                                              //         })
                                              //     : Container(),
                                            ],
                                          );
                                        }),
                                  ],
                                );
                              }),
                        ],
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

class TreeItemWidget extends StatelessWidget {
  final double topSizeWidth;
  final bool isActive;
  final String title;
  final String desc;
  const TreeItemWidget({
    required this.title,
    required this.desc,
    this.topSizeWidth = 30,
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: getHorizontalSize(context, topSizeWidth),
        ),
        RotationTransition(
          turns: AlwaysStoppedAnimation((isActive ? 0 : 270) / 360),
          child: SvgPicture.asset(
            AssetsConstant.arrow,
            color: ColorConstant.lime700.withOpacity(isActive ? 1.0 : 0.3),
          ),
        ),
        SizedBox(
          width: getHorizontalSize(context, 10),
        ),
        TitelDescWidget(
          title: title,
          desc: desc,
        )
      ],
    );
  }
}

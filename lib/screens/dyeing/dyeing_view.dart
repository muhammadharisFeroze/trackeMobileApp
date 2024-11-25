// ignore_for_file: must_be_immutable

import 'package:feroze_mills/helper/app_export.dart';

class DyeingView extends GetView<DyeingController> {
  const DyeingView({super.key});

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
                  appBarTitle: 'Dyeing Details',
                  isMoreCustom: true,
                  name: controller.homeController.selectedItem.value.custName ??
                      "",
                  message: "${controller.dyeingList.length} Entries",
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
                          var item = controller.dyeingList[index];
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
                                        titleRight: "Ordersheet No.",
                                        descRight: "${item.osNo ?? ""}"),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    ExpnadedRowWidget(
                                        titleLeft: "Color Code",
                                        descLeft: item.colorCode ?? "",
                                        titleRight: "Program No.",
                                        descRight: "${item.dProgramNo ?? ""}"),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    ExpnadedRowWidget(
                                        titleLeft: "Dyer Name",
                                        descLeft: item.dyerName ?? "",
                                        titleRight: "Lot No.",
                                        descRight: item.lotNo ?? ""),
                                    SizedBox(
                                      height: getVerticalSize(context, 5),
                                    ),
                                    TextButtonWidget(onPressed: () {
                                      controller.dyeingData = item;
                                      controller.dyeingIssueReceivedList.value =
                                          item.dyeingIssueReceived ?? [];
                                      Get.toNamed(
                                          AppRoute.dyeIssuedAndReceived);
                                    }),
                                  ]));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: getVerticalSize(context, 10),
                          );
                        },
                        itemCount: controller.dyeingList.length,
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

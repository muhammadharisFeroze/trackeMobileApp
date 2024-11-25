// import '../../helper/app_export.dart';

// class WeavingView extends GetView<WeavingController> {
//   const WeavingView({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.whiteA700,
//       body: Obx(() {
//         return Stack(
//           children: [
//             CustomScrollView(
//               shrinkWrap: true,
//               physics: const BouncingScrollPhysics(),
//               controller: controller.scrollController,
//               slivers: [
//                 AppbarWidget(
//                   isSliverAppBarExpanded:
//                       controller.isSliverAppBarExpanded.value,
//                   appBarTitle: 'Weaving Details',
//                   isMoreCustom: true,
//                   name: controller.homeController.selectedItem.value.custName ??
//                       "",
//                   message: "${controller.weavingList.length} Entries",
//                   inquiryDetail:
//                       "Inquiry: ${controller.homeController.selectedItem.value.inquiryNo ?? ""}",
//                 ),
//                 SliverPadding(
//                     padding: UIhelper.paddingHelper(context,
//                         top: 20, bottom: 20, right: 20, left: 20),
//                     sliver: SliverList(
//                         delegate: SliverChildListDelegate([
//                       ListView.separated(
//                           physics: const NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           padding: EdgeInsets.zero,
//                           itemBuilder: (context, index) {
//                             var item = controller.weavingList[index];
//                             return Container(
//                                 padding: UIhelper.paddingHelper(context,
//                                     top: 10, bottom: 10, right: 10, left: 10),
//                                 decoration:
//                                     UIhelper.rsoundedBorderFill(context),
//                                 child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       ExpnadedRowWidget(
//                                           titleLeft: "Quality Code",
//                                           descLeft: item.qualityCode ?? "",
//                                           titleRight: "Weaver PO",
//                                           descRight: "${item.weaverPo ?? ""}"),
//                                       SizedBox(
//                                         height: getVerticalSize(context, 15),
//                                       ),
//                                       ExpnadedRowWidget(
//                                           titleLeft: "Weaver Order No.",
//                                           descLeft: "${item.woNo ?? ""}",
//                                           titleRight: "Factory Inquiry",
//                                           descRight:
//                                               "${item.factoryInquiry ?? ""}"),
//                                       SizedBox(
//                                         height: getVerticalSize(context, 15),
//                                       ),
//                                       TitelDescWidget(
//                                           title: "Weaver Name",
//                                           desc: item.weaverName ?? ""),
//                                       SizedBox(
//                                         height: getVerticalSize(context, 5),
//                                       ),
//                                       item.weaverIssueReceived!.isNotEmpty
//                                           ? TextButtonWidget(onPressed: () {
//                                               controller.weavingData = item;
//                                               controller.weaverIssueReceivedList
//                                                       .value =
//                                                   item.weaverIssueReceived ??
//                                                       [];
//                                               Get.toNamed(AppRoute
//                                                   .weavingIssuedAndReceived);
//                                             })
//                                           : Container(),
//                                     ]));
//                           },
//                           separatorBuilder: (BuildContext context, int index) {
//                             return SizedBox(
//                               height: getVerticalSize(context, 10),
//                             );
//                           },
//                           itemCount: controller.weavingList.length),
//                     ]))),
//               ],
//             ),
//             controller.isLoading.value
//                 ? const ScreenLoadingWidget()
//                 : Container()
//           ],
//         );
//       }),
//     );
//   }
// }
import '../../helper/app_export.dart';

class WeavingView extends GetView<WeavingController> {
  const WeavingView({super.key});

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
                  appBarTitle: 'Weaving Details',
                  isMoreCustom: true,
                  name: controller.homeController.selectedItem.value.custName ??
                      "",
                  message: "${controller.weavingList.length} Entries",
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
                            var item = controller.weavingList[index];
                            return Container(
                                padding: UIhelper.paddingHelper(context,
                                    top: 10, bottom: 10, right: 10, left: 10),
                                decoration: UIhelper.rsoundedBorderFill(context),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ExpnadedRowWidget(
                                          titleLeft: "Quality Code",
                                          descLeft: item.qualityCode ?? "",
                                          titleRight: "Weaver PO",
                                          descRight: "${item.weaverPo ?? ""}"),
                                      SizedBox(
                                        height: getVerticalSize(context, 15),
                                      ),
                                      ExpnadedRowWidget(
                                          titleLeft: "Weaver Order No.",
                                          descLeft: "${item.woNo ?? ""}",
                                          titleRight: "Factory Inquiry",
                                          descRight:
                                              "${item.factoryInquiry ?? ""}"),
                                      SizedBox(
                                        height: getVerticalSize(context, 15),
                                      ),
                                      TitelDescWidget(
                                          title: "Weaver Name",
                                          desc: item.weaverName ?? ""),
                                      SizedBox(
                                        height: getVerticalSize(context, 5),
                                      ),
                                      item.weaverIssueReceived!.isNotEmpty
                                          ? TextButtonWidget(onPressed: () {
                                              controller.weavingData = item;
                                              controller.weaverIssueReceivedList
                                                      .value =
                                                  item.weaverIssueReceived ??
                                                      [];
                                              Get.toNamed(AppRoute
                                                  .weavingIssuedAndReceived);
                                            })
                                          : Container(),
                                    ]));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: getVerticalSize(context, 10),
                            );
                          },
                          itemCount: controller.weavingList.length),
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

import "package:feroze_mills/helper/app_export.dart";

class BalesCombinationView extends GetView<BalesCombinationCOntroller> {
  const BalesCombinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  appBarTitle: 'Bales Combination',
                  isMoreCustom: true,
                  name: controller.homeController.selectedItem.value.custName ??
                      "",
                  //   message: "${controller.spinningDataList.length} Entries",
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
                            var balesitem = controller.balesDataListing[index];
                            // var item = controller.balesList[index];
                            return Container(
                                padding: UIhelper.paddingHelper(context,
                                    top: 10, bottom: 10, right: 10, left: 10),
                                decoration:
                                    UIhelper.rsoundedBorderFill(context),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ExpnadedRowWidget(
                                          titleLeft: "Lot No",
                                          descLeft: balesitem.lotNo![index]
                                              .toString(),
                                          titleRight: "Station Name",
                                          descRight:
                                              balesitem.stationName.toString()),
                                      SizedBox(
                                        height: getVerticalSize(context, 15),
                                      ),
                                      ExpnadedRowWidget(
                                        titleLeft: "Ginner Number",
                                        descLeft:
                                            balesitem.ginnerName.toString(),
                                        titleRight: "",
                                        descRight: "",
                                      ),

                                      SizedBox(
                                        height: getVerticalSize(context, 5),
                                      ),
                                      //  item.weaverIssueReceived!.isNotEmpty
                                      //  ? TextButtonWidget(onPressed: () {

                                      //      })
                                      //: Container(),
                                    ]));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: getVerticalSize(context, 10),
                            );
                          },
                          itemCount: controller.balesDataListing.length),
                    ]))),
                controller.isLoading.value
                    ? const ScreenLoadingWidget()
                    : Container()
              ],
            ),
          ],
        );
      }),
    );
  }
}

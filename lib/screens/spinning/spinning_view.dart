import '../../helper/app_export.dart';

class SpinningView extends GetView<SpinningController> {
  const SpinningView({super.key});

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
                  appBarTitle: "Spinning Details",
                  isMoreCustom: true,
                  name: controller.homecontroller.selectedItem.value.custName ??
                      "",
                  message: "${controller.spinningDataList.length} Entries",
                  inquiryDetail:
                      "Inquiry: ${controller.homecontroller.selectedItem.value.inquiryNo ?? ""}",
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
                        itemCount: controller.spinningDataList.length,
                        itemBuilder: (context, index) {
                          var item = controller.spinningDataList[index];
                          return Container(
                              padding: UIhelper.paddingHelper(context,
                                  top: 10, bottom: 10, right: 10, left: 10),
                              decoration: UIhelper.rsoundedBorderFill(context),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ExpnadedRowWidget(
                                        titleLeft: "Lot No",
                                        descLeft: item.lotNo!,
                                        titleRight: "Date/Time",
                                        descRight: item.yarnMkdt.toString()),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    ExpnadedRowWidget(
                                        titleLeft: "bccFolio",
                                        descLeft: item.bccFolio.toString(),
                                        titleRight: "Location Name",
                                        descRight:
                                            item.weavingLocation.toString()),
                                    SizedBox(
                                      height: getVerticalSize(context, 15),
                                    ),
                                    TitelDescWidget(
                                        title: "Yarn Description",
                                        desc: item.yarnDesc.toString()),
                                    SizedBox(
                                      height: getVerticalSize(context, 5),
                                    ),
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          controller.spinningData = item;

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BalesScreen(
                                                        bccFolineNumber:
                                                            item.bccFolio!),
                                              ));
                                        
                                        },
                                        child: const Text(
                                            "View Bales Combination >"),
                                      ),
                                    )
                                  
                                  ]));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: getVerticalSize(context, 10),
                          );
                        },
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

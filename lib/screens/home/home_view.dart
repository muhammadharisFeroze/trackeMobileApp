// ignore_for_file: must_be_immutable

import 'package:feroze_mills/helper/app_export.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  var pages = [
    'Change Password',
    'Logout',
  ];
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => UIhelper.unFocus(),
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: AspectRatio(
                aspectRatio: size(context).aspectRatio + .00001,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: UIhelper.paddingHelper(context,
                            top: 42, bottom: 20, right: 22, left: 22),
                        decoration: BoxDecoration(
                          color: ColorConstant.blueGray,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(getSize(context, 22)),
                            bottomRight: Radius.circular(getSize(context, 22)),
                          ),
                          gradient: LinearGradient(
                              begin: const Alignment(0, .7),
                              end: const Alignment(0, 1),
                              stops: const [
                                .5,
                                1.0
                              ],
                              colors: [
                                ColorConstant.blueGray,
                                ColorConstant.gray300,
                              ]),
                        ),
                        child: Column(
                          children: [
                             SizedBox(
                              height: getVerticalSize(context, 16),
                            ),
                            AspectRatio(
                                aspectRatio: 181 / 40,
                                child: Image.asset(AssetsConstant.trackelogo)),
                            // SizedBox(
                            //   height: getVerticalSize(context, 11),
                            // ),
                            // Text(
                            //   'Tracke',
                            //   style: AppStyle.txtRobotoRomanSemiBold14(context).copyWith(fontSize: 18.0),
                            // ),
                            SizedBox(
                              height: getVerticalSize(context, 26),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Greetings!',
                                        style: AppStyle
                                            .txtRobotoRomanRegular16Gray900(
                                                context),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${controller.userInfo.info?.firstName ?? ""} ${controller.userInfo.info?.lastName ?? ""}",
                                            style:
                                                AppStyle.txtRobotoRomanBold20(
                                                        context)
                                                    .copyWith(
                                              fontSize:
                                                  getFontSize(context, 24),
                                            ),
                                          ),
                                          PopupMenuButton(
                                            padding: EdgeInsets.zero,
                                            splashRadius: 1,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            itemBuilder: (ctx) => [
                                              _buildPopupMenuItem(context,
                                                  title: 'Change Password',
                                                  onTap: () {
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 100),
                                                    () async {
                                                  Get.toNamed(
                                                      AppRoute.changePassword);
                                                });
                                              }),
                                              _buildPopupMenuItem(
                                                context,
                                                title: 'Logout',
                                                onTap: () {
                                                  controller.logOut();
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: UIhelper.paddingHelper(context,
                              top: 23, bottom: 23, right: 23, left: 23),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Track Order',
                                style: AppStyle.txtRobotoRomanMedium20(context),
                              ),
                              Text(
                                'You can search order by entering your Inquiry no, Customer PO no, or Ordersheet no.',
                                style:
                                    AppStyle.txtRobotoRomanRegular14(context),
                              ),
                              Column(
                                children: [
                                  homePageSearchFieldWidget(
                                    context,
                                    hint: 'Enter inquiry no.',
                                    textEditingController:
                                        controller.inquiryController,
                                    focusNode: controller.focusNodes[0],
                                    function: controller.inquirySearch,
                                    isActive: controller.isInquiry,
                                    isLoading: controller.isInquiryLoading,
                                  ),
                                  homePageSearchFieldWidget(
                                    context,
                                    hint: 'Enter PO no.',
                                    textEditingController:
                                        controller.poController,
                                    focusNode: controller.focusNodes[1],
                                    function: controller.poSearch,
                                    isActive: controller.isPO,
                                    isLoading: controller.isPOLoading,
                                  ),
                                  homePageSearchFieldWidget(
                                    context,
                                    hint: 'Enter Ordersheet no.',
                                    textEditingController:
                                        controller.orderSheetController,
                                    focusNode: controller.focusNodes[2],
                                    function: controller.orderSheetSearch,
                                    isActive: controller.isOrderSheet,
                                    isLoading: controller.isOrderSheetLoading,
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                      child: Divider(
                                    thickness: 1.2,
                                  )),
                                  Text(' OR '),
                                  Expanded(
                                      child: Divider(
                                    thickness: 1.2,
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(context, 1),
                              ),
                              DefaultButtonWidget(
                                icon: Padding(
                                  padding:
                                      UIhelper.paddingHelper(context, right: 3),
                                  child: SvgPicture.asset(
                                    AssetsConstant.barcodeScanner,
                                    height: getSize(context, 18),
                                  ),
                                ),
                                buttonText: ' Scan BarCode',
                                btnColor: ColorConstant.indigo800,
                                borderRadius: 6,
                                onPressed: () {
                                  controller.isScanSearch.value = false;
                                  Get.bottomSheet(BottomSheetScanType(
                                    scanType: (value) => controller
                                        .selectedScanType.value = value,
                                  ));
                                },
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Feroze 1888 Mills Limited',
                                        style: AppStyle
                                            .txtRobotoRomanRegular16Indigo800(
                                                context),
                                      ),
                                      Text(
                                        'Version 0.1.12',
                                        style: AppStyle
                                            .txtRobotoRomanRegular16Gray900(
                                                context),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            Obx(() {
              return controller.isLoading.value
                  ? const ScreenLoadingWidget()
                  : Container();
            }),
          ],
        ),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(context,
      {required String title, required Function() onTap}) {
    return PopupMenuItem(
      onTap: onTap,
      child: Text(
        title,
        style: AppStyle.txtRobotoRomanRegular16Gray900(context)
            .copyWith(color: title == 'Logout' ? ColorConstant.red100 : null),
      ),
    );
  }

  Widget homePageSearchFieldWidget(
    BuildContext context, {
    required TextEditingController textEditingController,
    required FocusNode focusNode,
    required Function() function,
    required RxBool isActive,
    required RxBool isLoading,
    required String hint,
  }) {
    return Obx(() {
      return Padding(
        padding: UIhelper.paddingHelper(context,
            top: 0, bottom: 10, right: 0, left: 0),
        child: SizedBox(
          child: TextFormFieldWidget(
            controller: textEditingController,
            focusNode: focusNode,
            suffixRow: false,
            hint: hint,
            padding: 0,
            validator: (value) {
              return null;
            },
            textInputAction: TextInputAction.search,
            // keyboardType: const TextInputType.numberWithOptions(decimal: true),
            // inputFormatters: [
            //   FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))
            // ],
            onFieldSubmitted: isActive.value
                ? (_) {
                    box.write('inquiry_value', textEditingController.text);
                    UIhelper.unFocus();
                    function();
                  }
                : null,
            icon: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: ColorConstant.gray100,
                onTap: isActive.value
                    ? () {
                        box.write('inquiry_value', textEditingController.text);
                        UIhelper.unFocus();
                        function();
                      }
                    : null,
                child: Container(
                  width: getHorizontalSize(context, 70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: isActive.value
                        ? ColorConstant.lime700
                        : ColorConstant.lime700.withOpacity(.4),
                  ),
                  child: Center(
                    child: isLoading.value
                        ? SizedBox(
                            width: getSize(context, 16),
                            child: CircularProgressIndicator(
                              color: ColorConstant.indigo800,
                              strokeWidth: getSize(context, 2),
                            ),
                          )
                        : Text('Search',
                            style: AppStyle.txtRobotoRomanRegular16(context)
                                .copyWith(color: ColorConstant.whiteA700)),
                  ),
                ),
              ),
            ),
            onChanged: (value) {
              isActive.value = value != '' ? true : false;
            },
          ),
        ),
      );
    });
  }
}

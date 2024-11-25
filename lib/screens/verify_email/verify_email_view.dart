// ignore_for_file: must_be_immutable

import 'package:feroze_mills/helper/app_export.dart';

class VerifyEmailView extends GetView<VerifyEmailController> {
  VerifyEmailView({super.key});
  TextEditingController emailController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      resizeToAvoidBottomInset: false,
      body: AspectRatio(
        aspectRatio: (size(context).width / size(context).height) + .00001,
        child: Stack(
          children: [
            CustomScrollView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                controller: controller.scrollController,
                slivers: [
                  Obx(() {
                    return AppbarWidget(
                      isSliverAppBarExpanded:
                          controller.isSliverAppBarExpanded.value,
                      appBarTitle: 'Verify Email',
                    );
                  }),
                  SliverPadding(
                      padding: UIhelper.paddingHelper(context,
                          top: 6, bottom: 20, right: 20, left: 20),
                      sliver: SliverList(
                          delegate: SliverChildListDelegate([
                        RichText(
                            text: TextSpan(
                                text:
                                    'We have sent a 5 digit verification code at your email: ',
                                style:
                                    AppStyle.txtRobotoRomanRegular16(context),
                                children: [
                              TextSpan(
                                  text: 'usman.saeed@codelabs.inc',
                                  style:
                                      AppStyle.txtRobotoRomanRegular16(context)
                                          .copyWith(
                                              color: ColorConstant.lime700))
                            ])),
                        SizedBox(
                          height: getVerticalSize(context, 36),
                        ),
                        Form(
                          key: _formKey,
                          child: MyPinCodeTextFieldWidget(
                            controller: emailController,
                            onCodeChanged: (code) {
                              controller.isError = false;
                              if (code.length == 4) {
                                controller.otpCode = code;
                                // setState(() {});
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(context, 20),
                        ),
                        Text(
                          'Didn’t Receive Code?',
                          style: AppStyle.txtRobotoRomanMedium16(context),
                        ),
                        SizedBox(
                          height: getVerticalSize(context, 6),
                        ),
                        Text(
                          'RESEND (60s)',
                          style:
                              AppStyle.txtRobotoRomanMedium16Lime700(context),
                        )
                        //
                      ]))),
                ]),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color:
                            ColorConstant.fromHex('#c39d3d29').withOpacity(.3),
                        spreadRadius: 0,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10)
                  ], color: ColorConstant.whiteA700),
                  padding: UIhelper.paddingHelper(context,
                      top: 20, bottom: 20, right: 20, left: 20),
                  child: DefaultButtonWidget(
                      buttonText: 'Continue',
                      onPressed: () {
                        UIhelper.unFocus();
                        Get.toNamed(AppRoute.resetPassword);
                      })),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:feroze_mills/helper/app_export.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  ForgotPasswordView({super.key});
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
                      appBarTitle: 'Forgot Password',
                    );
                  }),
                  SliverPadding(
                      padding: UIhelper.paddingHelper(context,
                          top: 6, bottom: 20, right: 20, left: 20),
                      sliver: SliverList(
                          delegate: SliverChildListDelegate([
                        Text(
                          'Enter your email address to receive verificaiton code.',
                          style: AppStyle.txtRobotoRomanRegular16(context),
                        ),
                        SizedBox(
                          height: getVerticalSize(context, 36),
                        ),
                        Form(
                          key: _formKey,
                          child: TextFormFieldWidget(
                            controller: controller.emailController,
                            focusNode: focusNode,
                            hint: 'i.e. someone@email.com',
                            label: 'Email Address',
                            hintColor: ColorConstant.whiteA700,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (ValidationHelper.validateEmail(value ?? "")
                                  .isNotEmpty) {
                                return ValidationHelper.validateEmail(
                                    value ?? "");
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
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
                  child: Obx(() {
                    return DefaultButtonWidget(
                        isLoading: controller.isLoading.value,
                        buttonText: 'Continue',
                        onPressed: () {
                          UIhelper.unFocus();
                          if (_formKey.currentState!.validate()) {
                            debugPrint("loginService");
                            controller.forgotPasswordService(context);
                          }
                        });
                  })),
            )
          ],
        ),
      ),
    );
  }
}

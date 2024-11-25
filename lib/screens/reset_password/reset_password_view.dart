// ignore_for_file: must_be_immutable

import 'package:feroze_mills/helper/app_export.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  ResetPasswordView({super.key});
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
                      appBarTitle: 'Reset Password',
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
                              'Please enter your new password and confirm new password.',
                          style: AppStyle.txtRobotoRomanRegular16(context),
                        )),
                        SizedBox(
                          height: getVerticalSize(context, 36),
                        ),
                        Obx(() {
                          return Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormFieldWidget(
                                    label: 'New Password',
                                    hint: '*****',
                                    hintColor: ColorConstant.whiteA700,
                                    controller:
                                        controller.newPasswordController,
                                    focusNode: controller.focusNodes[0],
                                    obscure:
                                        controller.newObscurePassword.value,
                                    textInputAction: TextInputAction.next,
                                    padding: 13,
                                    validator: (value) {
                                      if (ValidationHelper.validatePassword(
                                              value ?? "")
                                          .isNotEmpty) {
                                        return ValidationHelper
                                            .validatePassword(value ?? "");
                                      } else {
                                        return null;
                                      }
                                    },
                                    icon: IconButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {
                                        controller.newObscurePassword.value =
                                            !controller
                                                .newObscurePassword.value;
                                      },
                                      splashRadius: 5,
                                      icon: Icon(
                                        controller.newObscurePassword.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: getSize(context, 20),
                                        color: controller.focusNodes[0].hasFocus
                                            ? ColorConstant.black900
                                            : ColorConstant.bluegray100,
                                      ),
                                    ),
                                  ),
                                  TextFormFieldWidget(
                                    label: 'Confirm New Password',
                                    hint: '*****',
                                    hintColor: ColorConstant.whiteA700,
                                    controller:
                                        controller.confirmPasswordController,
                                    focusNode: controller.focusNodes[1],
                                    obscure:
                                        controller.confirmObscurePassword.value,
                                    textInputAction: TextInputAction.next,
                                    padding: 13,
                                    validator: (value) {
                                      if (ValidationHelper.validatePassword(
                                              value ?? "",
                                              isConfirm: true,
                                              password: controller
                                                  .newPasswordController.text)
                                          .isNotEmpty) {
                                        return ValidationHelper
                                            .validatePassword(value ?? "",
                                                isConfirm: true,
                                                password: controller
                                                    .newPasswordController
                                                    .text);
                                      } else {
                                        return null;
                                      }
                                    },
                                    icon: IconButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {
                                        controller
                                                .confirmObscurePassword.value =
                                            !controller
                                                .confirmObscurePassword.value;
                                      },
                                      splashRadius: 5,
                                      icon: Icon(
                                        controller.confirmObscurePassword.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: getSize(context, 20),
                                        color: controller.focusNodes[1].hasFocus
                                            ? ColorConstant.black900
                                            : ColorConstant.bluegray100,
                                      ),
                                    ),
                                  )
                                ],
                              ));
                        }),
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
                        buttonText: 'Confirm',
                        isLoading: controller.isLoading.value,
                        onPressed: () {
                          UIhelper.unFocus();
                          if (_formKey.currentState!.validate()) {
                            controller.changePasswordService();
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

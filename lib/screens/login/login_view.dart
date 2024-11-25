import 'package:feroze_mills/helper/app_export.dart';
import 'package:flutter/widgets.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController lastname =TextEditingController();
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => UIhelper.unFocus(),
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: AspectRatio(
            aspectRatio: (size(context).width / size(context).height) + .00001,
            child: Stack(
              children: [
                CustomScrollView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverPadding(
                        padding: UIhelper.paddingHelper(context,
                            top: 40, bottom: 20, right: 20, left: 20),
                        sliver: SliverList(
                            delegate: SliverChildListDelegate([
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                    SizedBox(
                                height: getVerticalSize(context, 26),),
                              Padding(
                                padding: UIhelper.paddingHelper(context,
                                    top: 0, bottom: 0, right: 66, left: 66),
                                child: SizedBox(
                                  height: 100.0,
                                  width: 300.0,
                                  child: Image.asset(AssetsConstant.tracke)),
                              ),
                              SizedBox(
                                height: getVerticalSize(context, 11),)
                              // ),
                              // Text(
                              //   'Traceablity',
                              //   style:
                              //       AppStyle.txtRobotoRomanSemiBold14(context),
                              // )
                            ],
                          ),
                          SizedBox(
                            height: getVerticalSize(context, 67),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Login',
                                  style: AppStyle.txtRobotoRomanExtraBold24(
                                      context),
                                ),
                                SizedBox(
                                  height: getVerticalSize(context, 6),
                                ),
                                Text(
                                  'Enter your email address and password to access your account.',
                                  style:
                                      AppStyle.txtRobotoRomanRegular16(context),
                                ),
                                SizedBox(
                                  height: getVerticalSize(context, 36),
                                ),
                                
                               
                               // TextFormFieldWidget(controller: lastname, focusNode: focusNode,lastName: '',hint: '',label: '',),
                                TextFormFieldWidget(
                                  hintColor: ColorConstant.whiteA700,
                                  label: 'Email Address',
                                  hint: 'i.e. someone@gmail.com',
                                  padding: 16,
                                  controller: controller.emailController,
                                  focusNode: controller.focusNodes[0],
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (ValidationHelper.validateEmail(
                                            value ?? "")
                                        .isNotEmpty) {
                                      return ValidationHelper.validateEmail(
                                          value ?? "");
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                Obx(() {
                                  return TextFormFieldWidget(
                                    label: 'Password',
                                    hint: '*****',
                                    hintColor: ColorConstant.whiteA700,
                                    controller: controller.passwordController,
                                    focusNode: controller.focusNodes[1],
                                    obscure: controller.obscurePassword.value,
                                    textInputAction: TextInputAction.done,
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
                                        controller.obscurePassword.value =
                                            !controller.obscurePassword.value;
                                      },
                                      splashRadius: 5,
                                      icon: Icon(
                                        controller.obscurePassword.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: getSize(context, 20),
                                        color: controller.focusNodes[1].hasFocus
                                            ? ColorConstant.black900
                                            : ColorConstant.bluegray100,
                                      ),
                                    ),
                                  );
                                }),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                AppRoute.forgotPassword);
                                          },
                                          child: Text(
                                            'Forgot Password?',
                                            style: AppStyle
                                                .txtRobotoRomanRegular16Indigo800(
                                                    context),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]))),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: ColorConstant.fromHex('#c39d3d29')
                                .withOpacity(.3),
                            spreadRadius: 0,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 10)
                      ], color: ColorConstant.whiteA700),
                      padding: UIhelper.paddingHelper(context,
                          top: 20, bottom: 20, right: 20, left: 20),
                      child: Obx(() {
                        return DefaultButtonWidget(
                            buttonText: 'Login',
                            isLoading: controller.isLoading.value,
                            onPressed: () {
                              UIhelper.unFocus();
                              if (_formKey.currentState!.validate()) {
                                debugPrint("loginService");
                                controller.loginService();
                              }
                              // Get.to(() => DashboardBottomNavigation());
                            });
                      })),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

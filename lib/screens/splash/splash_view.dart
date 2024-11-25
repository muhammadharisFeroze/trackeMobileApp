import 'package:feroze_mills/helper/app_export.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarOpacity: 0,
          toolbarHeight: 0,
          bottomOpacity: 0,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark),
      body: Center(
          child: Padding(
        padding: UIhelper.paddingHelper(context,
            top: 0, bottom: 20, right: 59, left: 59),
        child: GetBuilder<SplashController>(
            init: SplashController(),
            builder: (controller) {
              return FadeTransition(
                opacity: controller.animationController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  SizedBox(
                    height: 200.0,
                    width: 300.0,
                    child: Image.asset(AssetsConstant.tracke)),
                   // Image.asset(AssetsConstant.ferozeLogo),
                    // SizedBox(
                    //   height: getVerticalSize(context, 11),
                    // ),
                    // Text(
                    //   'Tracke',
                    //   style: AppStyle.txtRobotoRomanSemiBold14(context).copyWith(fontSize: 24.0),
                    // ),
                  ],
                ),
              );
            }),
      )),
    );
  }
}

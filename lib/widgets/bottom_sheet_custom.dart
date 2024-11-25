// ignore_for_file: use_key_in_widget_constructors

import '../helper/app_export.dart';

class BottomSheetCustom extends StatelessWidget {
  final String title;
  final String message;
  final bool isBack;
  final Function()? navigationBack;
  final String btnText;
  const BottomSheetCustom({
    this.title = 'Alert!',
    required this.message,
    this.isBack = false,
    this.navigationBack,
    this.btnText = 'Ok',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIhelper.paddingHelper(context,
          top: 20, bottom: 20, right: 20, left: 20),
      // height: 200,
      width: size(context).width,
      decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(getSize(context, 16)),
              topRight: Radius.circular(getSize(context, 16)))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: AppStyle.txtRobotoRomanMedium20(context).copyWith(
                fontSize: getFontSize(context, 18),
              )),
          SizedBox(
            height: getVerticalSize(
              context,
              15,
            ),
          ),
          Text(message,
              style: AppStyle.txtRobotoRomanMedium20(context)
                  .copyWith(fontSize: getFontSize(context, 14))),
          SizedBox(
            height: getVerticalSize(context, 30),
          ),
          DefaultButtonWidget(
            buttonText: btnText,
            onPressed: isBack
                ? navigationBack
                : () {
                    Get.back();
                  },
          )
        ],
      ),
    );
  }
}

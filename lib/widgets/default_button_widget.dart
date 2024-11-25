// ignore_for_file: use_key_in_widget_constructors

import '../helper/app_export.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget(
      {required this.buttonText,
      required this.onPressed,
      this.btnColor,
      this.textColor,
      this.isLoading = false,
      this.icon,
      this.iconLeft,
      this.height = 50,
      this.enable = true,
      this.borderRadius,
      this.fontSize = 16});
  final String buttonText;
  final Function()? onPressed;
  final Color? btnColor;
  final Color? textColor;
  final bool isLoading;
  final Widget? icon;
  final Widget? iconLeft;
  final double height;
  final bool enable;
  final double? borderRadius;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: double.infinity,
      height: getVerticalSize(context, height),
      child: ElevatedButton(
        onPressed: enable
            ? isLoading
                ? () {}
                : onPressed
            : () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: isLoading
                ? ColorConstant.gray400
                : btnColor ?? ColorConstant.lime700,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(getSize(context, borderRadius ?? 6)),
            )),
        child: isLoading
            ? Center(
                child: SizedBox(
                height: getSize(context, 20),
                width: getSize(context, 20),
                child: CircularProgressIndicator(
                  color: ColorConstant.indigo800,
                  strokeWidth: getSize(context, 3),
                ),
              ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? Container(),
                  Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.txtRobotoRegular16(context).copyWith(
                      
                        color: textColor ?? ColorConstant.whiteA700,
                        fontSize: 16.0),
                  ),
                  iconLeft ?? Container(),
                ],
              ),
      ),
    );
  }
}

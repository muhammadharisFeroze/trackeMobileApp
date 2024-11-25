import '../helper/app_export.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    this.buttonText = 'View Issued & Received',
    required this.onPressed,
    super.key,
  });

  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: AppStyle.txtRobotoRomanRegular16Indigo800(context),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: ColorConstant.indigo800,
            size: getSize(context, 12),
          )
        ],
      ),
    );
  }
}

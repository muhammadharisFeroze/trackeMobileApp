import '../helper/app_export.dart';

class SearchTextScanButtonWidget extends StatelessWidget {
  const SearchTextScanButtonWidget({
    super.key,
    required this.textEditController,
    this.onChanged,
    this.hint = 'Search Quality Code',
    required this.onPressed,
  });

  final TextEditingController textEditController;
  final Function(String)? onChanged;
  final String hint;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(context, 45),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: SearchTextField(
              controller: textEditController,
              hint: hint,
              onChanged: onChanged!,
            ),
          ),
          SizedBox(
            width: getHorizontalSize(context, 5),
          ),
          DefaultButtonWidget(
            height: 45,
            icon: SvgPicture.asset(
              AssetsConstant.barcodeScanner,
              height: getSize(context, 18),
            ),
            buttonText: ' Scan',
            btnColor: ColorConstant.indigo800,
            borderRadius: 6,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:intl/intl.dart';

import 'app_export.dart';

class UIhelper {
  static EdgeInsets paddingHelper(BuildContext context,
          {double top = 0,
          double bottom = 0,
          double right = 0,
          double left = 0}) =>
      EdgeInsets.only(
        top: getHorizontalSize(context, top),
        left: getVerticalSize(context, left),
        right: getVerticalSize(context, right),
        bottom: getHorizontalSize(context, bottom),
      );

  static snackBar(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // backgroundColor: ColorConstant.red700,
      duration: const Duration(milliseconds: 500),
      content: Text(
        message,
      ),
    ));
  }

  static unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String dateTimeFormat(DateTime value, {String format = "dd/MM/yyyy"}) {
    final f = DateFormat(format);
    return f.format(value);
  }

  static BoxDecoration roundedBorderLine(BuildContext context) {
    return BoxDecoration(
      border: Border.all(color: ColorConstant.gray10),
      borderRadius: BorderRadius.circular(getSize(context, 8)),
      color: ColorConstant.whiteA700,
    );
  }

  static BoxDecoration rsoundedBorderFill(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(getSize(context, 8)),
      color: ColorConstant.gray101,
    );
  }

  static capitalWords(TextEditingController edController, String value) {
    edController.value = TextEditingValue(
        text: value.toUpperCase(), selection: edController.selection);
  }
}

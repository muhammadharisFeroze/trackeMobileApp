import '../helper/app_export.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? lastName;
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final TextInputType? keyboardType;
  final bool enabled;
  final int manxLines;
  final Widget? icon;
  final bool suffixRow;
  final Widget? prefixIcon;
  final double padding;
  final TextCapitalization textCapitalization;
  final Color? hintColor;
  final bool? obscure;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final EditableText? text;
  final Function(String)? onFieldSubmitted;

  const TextFormFieldWidget(
      {Key? key,
      this.label,
      this.hint,
      this.lastName,
      required this.controller,
      required this.focusNode,
      this.onChanged,
      this.validator,
      this.keyboardType,
      this.enabled = true,
      this.manxLines = 1,
      this.icon,
      this.padding = 15,
      this.textCapitalization = TextCapitalization.none,
      this.prefixIcon,
      this.hintColor,
      this.obscure,
      this.inputFormatters,
      this.textInputAction,
      this.onFieldSubmitted,
      this.suffixRow = true,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: ColorConstant.gray300),
    );
    return Padding(
      padding: UIhelper.paddingHelper(context,
          top: 0, bottom: padding, right: 0, left: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Text(label!, style: AppStyle.txtRobotoRomanMedium16(context))
              : Container(),
          label != null
              ? SizedBox(
                  height: getVerticalSize(context, 6),
                )
              : Container(),
          TextFormField(
            enabled: enabled,
            autovalidateMode: focusNode.hasFocus
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            style: AppStyle.txtRobotoRomanRegular16Gray900(context),
            controller: controller,
            onChanged: onChanged,
            obscureText: obscure ?? false,
            textCapitalization: textCapitalization,
            inputFormatters: inputFormatters,
            validator: validator ??
                (value) {
                  if (value != null) {
                    if (ValidationHelper.validateRequired(value).isNotEmpty) {
                      return ValidationHelper.validateRequired(value);
                    } else {
                      return null;
                    }
                  }
                  return null;
                },
            focusNode: focusNode,
            maxLines: manxLines,
            textInputAction: textInputAction ?? TextInputAction.next,
            onFieldSubmitted: onFieldSubmitted ??
                (_) => FocusScope.of(context).requestFocus(),
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding: UIhelper.paddingHelper(context,
                  top: 0, bottom: 0, right: 0, left: 19),
              alignLabelWithHint: true,
              filled: true,

              fillColor: ColorConstant.whiteA700,
              prefixIcon: prefixIcon,
              // suffixIconConstraints:
              //     BoxConstraints(minWidth: getHorizontalSize(context, 30)),
              suffixIcon: enabled && icon == null
                  ? null
                  : suffixRow
                      ? IntrinsicHeight(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: icon ??
                                    Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: ColorConstant.black900,
                                    ),
                              ),
                            ],
                          ),
                        )
                      : icon,
              hintText: hint,
              hintStyle: AppStyle.txtRobotoRomanRegular16(context)
                  .copyWith(fontSize: getFontSize(context, 16)),
              errorStyle: TextStyle(
                //color: Theme.of(context).errorColor,
              ),
              labelStyle: AppStyle.txtRobotoRomanRegular16(context),
              errorBorder: outlineInputBorder.copyWith(
                borderSide: BorderSide(color: ColorConstant.redError),
              ),
              focusedErrorBorder: outlineInputBorder.copyWith(
                borderSide: BorderSide(color: ColorConstant.redError),
              ),
              focusedBorder: outlineInputBorder.copyWith(
                borderSide: BorderSide(color: ColorConstant.indigo901),
              ),
              border: outlineInputBorder.copyWith(
                borderSide: BorderSide(color: ColorConstant.indigo901),
              ),
              enabledBorder: outlineInputBorder,
              disabledBorder: outlineInputBorder,
            ),
          ),
        ],
      ),
    );
  }
}

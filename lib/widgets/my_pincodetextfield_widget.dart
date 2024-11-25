import '../helper/app_export.dart';

class MyPinCodeTextFieldWidget extends StatelessWidget {
  const MyPinCodeTextFieldWidget({
    Key? key,
    required this.onCodeChanged,
    this.controller,
  }) : super(key: key);

  final Function(String code) onCodeChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      appContext: context,
      scrollPadding: EdgeInsets.zero,
      length: 4,
      autoFocus: true,
      cursorColor: ColorConstant.black900.withOpacity(.7),
      obscureText: false,
      obscuringCharacter: '*',
      // keyboardType:
      //     const TextInputType.numberWithOptions(decimal: false, signed: true),
      keyboardType: TextInputType.number,
      autoDismissKeyboard: true,
      enableActiveFill: true,
      onChanged: onCodeChanged,
      pinTheme: PinTheme(
        fieldHeight: getVerticalSize(
          context,
          54,
        ),
        fieldWidth: getVerticalSize(
          context,
          54,
        ),
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(
          getSize(
            context,
            12,
          ),
        ),
        selectedFillColor: ColorConstant.whiteA700,
        activeFillColor: ColorConstant.whiteA700,
        inactiveFillColor: ColorConstant.whiteA700,
        inactiveColor: ColorConstant.gray300,
        selectedColor: ColorConstant.gray300,
        activeColor: ColorConstant.gray300,
        borderWidth: getSize(context, 2),
      ),
    );
  }
}

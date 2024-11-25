import '../helper/app_export.dart';

class SearchTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Function(String) onChanged;
  final double height;

  const SearchTextField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.onChanged,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: ColorConstant.gray301),
    );
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: UIhelper.paddingHelper(context,
            top: 5, bottom: 0, right: 0, left: 0),
        // contentPadding: EdgeInsets.zero,
        alignLabelWithHint: true,
        filled: true,
        fillColor: Colors.transparent,
        prefixIcon: Icon(
          Icons.search,
          // size: getSize(20),
          color: ColorConstant.gray400,
        ),
        hintText: hint,
        hintStyle: AppStyle.txtRobotoRegular16(context)
            .copyWith(color: ColorConstant.gray400),

        // changing color of border on focus
        focusedBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
      ),
    );
  }
}

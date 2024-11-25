import '../helper/app_export.dart';

class InquiryDetailsWidget extends StatelessWidget {
  const InquiryDetailsWidget({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyle.txtRobotoRomanRegular14(context),
            ),
          ],
        ),
        SizedBox(
          height: getVerticalSize(context, 5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              desc,
              style: AppStyle.txtRobotoRomanMedium16(context),
            ),
          ],
        ),
      ],
    );
  }
}

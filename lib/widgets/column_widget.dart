import '../helper/app_export.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key? key,
    required this.title1,
    required this.desc1,
    required this.title2,
    required this.desc2,
    this.isShowDivider = false,
  }) : super(key: key);

  final String title1;
  final String desc1;
  final String title2;
  final String desc2;
  final bool isShowDivider;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title1,
              style: AppStyle.txtRobotoRomanRegular14(context),
            ),
            Text(
              title2,
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
              desc1,
              style: AppStyle.txtRobotoRomanMedium16(context),
            ),
            Text(
              desc2,
              style: AppStyle.txtRobotoRomanMedium16(context),
            ),
          ],
        ),
        isShowDivider
            ? SizedBox(
                height: getVerticalSize(context, 10),
              )
            : Container(
                height: 0,
              ),
      ],
    );
  }
}

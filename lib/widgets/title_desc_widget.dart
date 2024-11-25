import '../helper/app_export.dart';

class TitelDescWidget extends StatelessWidget {
  final String title;
  final String desc;
  const TitelDescWidget({
    required this.title,
    required this.desc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title.isNotEmpty
            ? Text(
                title,
                style: AppStyle.txtRobotoRomanRegular14(context),
              )
            : Container(),
        SizedBox(
          height: getVerticalSize(context, title.isNotEmpty ? 5 : 0),
        ),
        Text(
          desc,
          style: AppStyle.txtRobotoRomanMedium16(context),
        ),
      ],
    );
  }
}

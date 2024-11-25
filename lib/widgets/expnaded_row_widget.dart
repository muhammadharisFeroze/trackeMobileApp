import '../helper/app_export.dart';

class ExpnadedRowWidget extends StatelessWidget {
  final String titleLeft;
  final String descLeft;
  final String titleRight;
  final String descRight;
  const ExpnadedRowWidget({
    required this.titleLeft,
    required this.descLeft,
    required this.titleRight,
    required this.descRight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TitelDescWidget(title: titleLeft, desc: descLeft),
        ),
        SizedBox(
          width: getHorizontalSize(context, 5),
        ),
        Expanded(
          flex: 2,
          child: TitelDescWidget(title: titleRight, desc: descRight),
        ),
      ],
    );
  }
}

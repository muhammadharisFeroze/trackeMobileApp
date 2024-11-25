import '../helper/app_export.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    this.inquiryDetail = "",
    this.message = "",
  }) : super(key: key);

  final String name;
  final String inquiryDetail;
  final String imageUrl;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: ColorConstant.indigo800,
              radius: getHorizontalSize(context, 22),
              child: SvgPicture.asset(AssetsConstant.userAvtar),
            ),
            SizedBox(
              width: getHorizontalSize(context, 5),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppStyle.txtRobotoRegular16(context)
                      .copyWith(color: ColorConstant.whiteA700),
                ),
                SizedBox(
                  height: getVerticalSize(context, 5),
                ),
                Text(
                  message.isNotEmpty ? message : inquiryDetail,
                  style: AppStyle.txtRobotoRegular16(context)
                      .copyWith(color: ColorConstant.whiteA700),
                ),
              ],
            )
          ],
        ),
        message.isNotEmpty
            ? Align(
                alignment: Alignment.topRight,
                child: Text(
                  inquiryDetail,
                  style: AppStyle.txtRobotoRegular16(context)
                      .copyWith(color: ColorConstant.whiteA700),
                ),
              )
            : Container(),
      ],
    );
  }
}

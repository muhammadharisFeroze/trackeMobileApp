import '../helper/app_export.dart';
import '../screens/po_details/image_viewer.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
    required this.title,
    required this.desc,
    this.isDivider = true,
    this.isShowImage = false,
    this.width = 60,
    this.height = 60,
    this.imageUrl = "",
  }) : super(key: key);

  final String title;
  final String desc;
  final bool isDivider;
  final bool isShowImage;
  final String imageUrl;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    var isImageFound = true;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyle.txtRobotoRomanMedium16(context),
            ),
            !isShowImage
                ? Text(
                    desc,
                    style: AppStyle.txtRobotoRomanMedium16(context),
                  )
                : SizedBox(
                    width: width,
                    height: height,
                    child: GestureDetector(
                      onTap: () {
                        if (isImageFound) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ImageViewer(image: imageUrl)));
                        }
                      },
                      child: Image.network(imageUrl, fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorConstant.blue400,
                          ),
                        );
                      }, errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                        isImageFound = false;
                        return Icon(
                          Icons.error_outline,
                          color: ColorConstant.redError,
                        );
                      }),
                    ),
                  )
          ],
        ),
        isDivider ? const Divider() : Container(),
      ],
    );
  }
}

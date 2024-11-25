import '../../helper/app_export.dart';

class ImageViewer extends StatelessWidget {
  final String image;
  const ImageViewer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black900,
      body: Center(
        child: InteractiveViewer(
          minScale: 0.1,
          maxScale: 2,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

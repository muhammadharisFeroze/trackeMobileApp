import 'package:lottie/lottie.dart';

import '../helper/app_export.dart';

class ScreenLoadingWidget extends StatelessWidget {
  const ScreenLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.black900.withOpacity(.5),
      child: Center(
          child: Lottie.asset('assets/loties/loader.json',
              height: getVerticalSize(context, 150))
       
          ),
    );
  }
}

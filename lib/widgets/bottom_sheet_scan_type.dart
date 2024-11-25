// ignore_for_file: use_key_in_widget_constructors

import '../helper/app_export.dart';

class BottomSheetScanType extends StatelessWidget {
  final ValueChanged<int>? scanType;

  const BottomSheetScanType({this.scanType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIhelper.paddingHelper(context,
          top: 20, bottom: 20, right: 20, left: 20),
      // height: 200,
      width: size(context).width,
      decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(getSize(context, 16)),
              topRight: Radius.circular(getSize(context, 16)))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("What do you want scan?",
              style: AppStyle.txtRobotoRomanMedium20(context).copyWith(
                fontSize: getFontSize(context, 18),
              )),
          SizedBox(
            height: getVerticalSize(
              context,
              18,
            ),
          ),
          DefaultButtonWidget(
             buttonText: 'Cutting Bags',
             // buttonText: 'Inquiry',
              onPressed: () {
                scanType!(ScanType.inquiry.index);
                Get.back();
                Get.toNamed(AppRoute.qrScanner);
              }),
          SizedBox(
            height: getVerticalSize(
              context,
              15,
            ),
          ),
          DefaultButtonWidget(
              buttonText: 'Purchase Order',
              btnColor: ColorConstant.indigo800,
              onPressed: () {
                scanType!(ScanType.purchaseOrder.index);
                Get.back();
                Get.toNamed(AppRoute.qrScanner);
              }),
          SizedBox(
            height: getVerticalSize(
              context,
              15,
            ),
          ),
          DefaultButtonWidget(
            buttonText: 'FG Carton',
            //  buttonText: 'Order Sheet',
              btnColor: ColorConstant.black900,
              onPressed: () {
                scanType!(ScanType.orderSheet.index);
                Get.back();
                Get.toNamed(AppRoute.qrScanner);
              }),
          SizedBox(
              height: getVerticalSize(
            context,
            15,
          )),
          DefaultButtonWidget(
              buttonText: 'Yarn Pallete',
               btnColor: ColorConstant.indigo800,
              onPressed: () {
                scanType!(ScanType.yarnPallete.index);
                Get.back(closeOverlays: true);
                Get.toNamed(AppRoute.qrScanner);
              }),
                SizedBox(
              height: getVerticalSize(
            context,
            15,
          )),
          DefaultButtonWidget(
              buttonText: 'Batcher Code',
              onPressed: () {
                scanType!(ScanType.batcherCode.index);
                Get.back(closeOverlays: true);
                Get.toNamed(AppRoute.qrScanner);
              })
        ],
      ),
    );
  }
}

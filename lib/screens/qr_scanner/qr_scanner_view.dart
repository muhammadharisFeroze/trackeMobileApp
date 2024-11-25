import 'package:feroze_mills/helper/app_export.dart';
import 'package:feroze_mills/widgets/scanned_barcode_widget.dart';
import 'package:feroze_mills/widgets/scanner_error_widget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerView extends GetView<QRScannerController> {
  QRScannerView({super.key});
  final qrKey = GlobalKey(debugLabel: 'QR');


  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 200,
      height: 200,
    );
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: ColorConstant.whiteA700),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: ColorConstant.whiteA700),
        title: Text(
          "Scan ${controller.titleScan()}",
          style: AppStyle.txtRobotoRomanExtraBold24(context)
              .copyWith(color: ColorConstant.whiteA700),
        ),
      ),
      body: Stack(
          children: [
            MobileScanner(
              fit: BoxFit.contain,
              scanWindow: scanWindow,
              onDetectError: (error, stackTrace) {
                print('onDetectError: $error');
                print('onDetectError: $stackTrace');
              },
              controller: controller.mobileScannerController,
              onDetect: (barcodes) => controller.onScanned(barcodes),
              errorBuilder: (context, error, child) {

                return ScannerErrorWidget(error: error);
              },
            ),
            _buildBarcodeOverlay(),
            _buildScanWindow(scanWindow),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 100,
                color: Colors.black.withOpacity(0.4),
                child: ScannedBarcodeLabel(barcodes: controller.mobileScannerController.barcodes),
              ),
            ),
            Obx(() {
              return controller.isLoading.value
                  ? const ScreenLoadingWidget()
                  : Container();
            }),
          ],
        ),
    );
  }

  Widget _buildBarcodeOverlay() {
    return ValueListenableBuilder(
      valueListenable: controller.mobileScannerController,
      builder: (context, value, child) {
        // Not ready.
        if (!value.isInitialized || !value.isRunning || value.error != null) {
         print("value.isRunning ${value.isRunning}");
         print("value.isInitialized ${value.isInitialized}");
          print('value.error: ${value.error?.errorCode}');
          return const SizedBox();
        }

        return StreamBuilder<BarcodeCapture>(
          stream: controller.mobileScannerController.barcodes,
          builder: (context, snapshot) {
            final BarcodeCapture? barcodeCapture = snapshot.data;

            // No barcode.
            if (barcodeCapture == null || barcodeCapture.barcodes.isEmpty) {
              return const SizedBox();
            }

            final scannedBarcode = barcodeCapture.barcodes.first;

            // No barcode corners, or size, or no camera preview size.
            if (value.size.isEmpty ||
                scannedBarcode.size.isEmpty ||
                scannedBarcode.corners.isEmpty) {
              return const SizedBox();
            }

            return CustomPaint(
              painter: BarcodeOverlay(
                barcodeCorners: scannedBarcode.corners,
                barcodeSize: scannedBarcode.size,
                boxFit: BoxFit.contain,
                cameraPreviewSize: value.size,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildScanWindow(Rect scanWindowRect) {
    return ValueListenableBuilder(
      valueListenable: controller.mobileScannerController,
      builder: (context, value, child) {
        // Not ready.
        if (!value.isInitialized ||
            !value.isRunning ||
            value.error != null ||
            value.size.isEmpty) {
          return const SizedBox();
        }

        return CustomPaint(
          painter: ScannerOverlay(scanWindowRect),
        );
      },
    );
  }


}
class ScannerOverlay extends CustomPainter {
  ScannerOverlay(this.scanWindow);

  final Rect scanWindow;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: use `Offset.zero & size` instead of Rect.largest
    // we need to pass the size to the custom paint widget
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath = Path()..addRect(scanWindow);

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BarcodeOverlay extends CustomPainter {
  BarcodeOverlay({
    required this.barcodeCorners,
    required this.barcodeSize,
    required this.boxFit,
    required this.cameraPreviewSize,
  });

  final List<Offset> barcodeCorners;
  final Size barcodeSize;
  final BoxFit boxFit;
  final Size cameraPreviewSize;

  @override
  void paint(Canvas canvas, Size size) {
    if (barcodeCorners.isEmpty ||
        barcodeSize.isEmpty ||
        cameraPreviewSize.isEmpty) {
      return;
    }

    final adjustedSize = applyBoxFit(boxFit, cameraPreviewSize, size);

    double verticalPadding = size.height - adjustedSize.destination.height;
    double horizontalPadding = size.width - adjustedSize.destination.width;
    if (verticalPadding > 0) {
      verticalPadding = verticalPadding / 2;
    } else {
      verticalPadding = 0;
    }

    if (horizontalPadding > 0) {
      horizontalPadding = horizontalPadding / 2;
    } else {
      horizontalPadding = 0;
    }

    final double ratioWidth;
    final double ratioHeight;

    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
      ratioWidth = barcodeSize.width / adjustedSize.destination.width;
      ratioHeight = barcodeSize.height / adjustedSize.destination.height;
    } else {
      ratioWidth = cameraPreviewSize.width / adjustedSize.destination.width;
      ratioHeight = cameraPreviewSize.height / adjustedSize.destination.height;
    }

    final List<Offset> adjustedOffset = [
      for (final offset in barcodeCorners)
        Offset(
          offset.dx / ratioWidth + horizontalPadding,
          offset.dy / ratioHeight + verticalPadding,
        ),
    ];

    final cutoutPath = Path()..addPolygon(adjustedOffset, true);

    final backgroundPaint = Paint()
      ..color = Colors.red.withOpacity(0.3)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    canvas.drawPath(cutoutPath, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

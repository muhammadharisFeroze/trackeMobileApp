// ignore_for_file: constant_identifier_names

import 'app_export.dart';

const num DESIGN_WIDTH = 360;
const num DESIGN_HEIGHT = 800;
const num DESIGN_STATUS_BAR = 0;

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(BuildContext context, double px) {
  return px * ((MediaQuery.of(context).size.width) / DESIGN_WIDTH);
}

///This method is used to set text font size according to Viewport width
double getFontSize(BuildContext context, double px) {
  return px * ((MediaQuery.of(context).size.width) / DESIGN_WIDTH) * (16 / 18);
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(BuildContext context, double px) {
  num statusBar = MediaQuery.of(context).viewPadding.top;
  num screenHeight = (MediaQuery.of(context).size.height) - statusBar;
  return px * (screenHeight / DESIGN_HEIGHT);
}

double getSize(BuildContext context, double px) {
  var height = getVerticalSize(context, px);
  var width = getHorizontalSize(context, px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

Size size(BuildContext context) {
  return MediaQuery.of(context).size;
}

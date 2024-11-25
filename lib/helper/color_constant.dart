import 'app_export.dart';

class ColorConstant {
  static Color green300 = fromHex('#65db86');

  static Color gray90099 = fromHex('#991e1e1e');

  static Color green3002b = fromHex('#2b65db86');

  static Color lime70075 = fromHex('#75c39d3d');

  static Color red500 = fromHex('#ec4141');

  static Color indigo8002b = fromHex('#2b2f388e');

  static Color black9003f = fromHex('#3f000000');

  static Color whiteA70033 = fromHex('#33ffffff');

  static Color gray9000c = fromHex('#0c1e1e1e');

  static Color blueGray = fromHex('#F3F4FB');

  static Color black900 = fromHex('#000000');

  static Color gray10 = fromHex('#E7E7E7');

  static Color black90063 = fromHex('#63000000');

  static Color black900Bf = fromHex('#bf000000');

  static Color gray400 = fromHex('#aeaeae');

  static Color lime70028 = fromHex('#28c39c3c');

  static Color gray301 = fromHex('#e6e6e6');

  static Color lime700 = fromHex('#c39d3d');

  static Color gray90087 = fromHex('#871e1e1e');

  static Color black9006c = fromHex('#6c000000');

  static Color gray900 = fromHex('#1e1e1e');

  static Color bluegray100 = fromHex('#d9d9d9');

  static Color gray101 = fromHex('#f4f4f4');

  static Color gray300 = fromHex('#e1e1e1');

  static Color gray102 = fromHex('#f2f2f2');

  static Color gray100 = fromHex('#f3f4fa');

  static Color whiteA70066 = fromHex('#66ffffff');

  static Color bluegray400 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color indigo800 = fromHex('#2f388e');

  static Color redError = fromHex('#F41B1B');

  static Color indigo901 = fromHex('#002f85');

  static Color red100 = fromHex('#ED4141');
  static Color blue400 = fromHex('#2F388E');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#ED9728");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");

  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black = HexColor.fromHex("#000000");
  static Color blue = HexColor.fromHex("#007bff");
  static Color indigo = HexColor.fromHex("#6610f2");
  static Color purple = HexColor.fromHex("#6f42c1");
  static Color pink = HexColor.fromHex("#e83e8c");
  static Color red = HexColor.fromHex("#dc3545");
  static Color orange = HexColor.fromHex("#fd7e14");
  static Color yellow = HexColor.fromHex("#ffc107");
  static Color green = HexColor.fromHex("#28a745");
  static Color teal = HexColor.fromHex("#20c997");
  static Color cyan = HexColor.fromHex("#17a2b8");
  static Color white = HexColor.fromHex("#ffff");
  static Color gray = HexColor.fromHex("#6c757d");
  static Color gray_dark = HexColor.fromHex("#343a40");
  static Color primary1 = HexColor.fromHex("#007bff");
  static Color secondary = HexColor.fromHex("#6c757d");
  static Color success = HexColor.fromHex("#28a745");
  static Color info = HexColor.fromHex("#17a2b8");
  static Color warning = HexColor.fromHex("#ffc107");
  static Color danger = HexColor.fromHex("#dc3545");
  static Color light = HexColor.fromHex("#f8f9fa");
  static Color dark = HexColor.fromHex("#343a40");
  static Color drawer_color = HexColor.fromHex('#2a2d35');
  static Color photo_border_color = HexColor.fromHex('#ed4242');
  static Color button_bg_color = HexColor.fromHex('#fd735a');
  static Color dark_bg_color = HexColor.fromHex('#25252d');
  static Color title_font_color_light = HexColor.fromHex('#333333');
  static Color content_font_color_light = HexColor.fromHex('#5f6f81');
  static Color content_bg_color_light = HexColor.fromHex('#f7f7f7');
  static Color border_color_light = HexColor.fromHex('#dee2e6');
  static Color card_bordercolor_light = HexColor.fromHex('#eeeeee');
}

class GradientManager {
  static LinearGradient commonGradient = LinearGradient(colors: [
    ColorManager.button_bg_color,
    HexColor.fromHex('#fa1f55'),
  ], begin: Alignment.topRight, end: Alignment.bottomLeft);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    if (hexColor.length == 3) {
      hexColor = 'FFFFF' + hexColor;
    }
    int color;
    try {
      color = int.parse(hexColor, radix: 16);
    } catch (E) {
      color = 4294967295;
    }
    return color;
  }
}

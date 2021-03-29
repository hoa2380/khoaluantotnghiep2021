import 'package:flutter/material.dart';

class AppColors {
  static final Color bottomBarColor = HexColor.fromHex("469AB2");
  static final Color exampleColor = HexColor.fromHex("3d6217");
  static final Color iconColor = HexColor.fromHex("FEFEFE");
  static final Color primaryColor = HexColor.fromHex('469AB2');
  static final Color primaryColorShadow = Color.fromRGBO(3, 120, 221, .2);
  static final Color primaryAccentColor = HexColor.fromHex('57C0DE');
  static final Color primaryTextColor = HexColor.fromHex('717171');
}

class HexColor {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    // ignore: always_put_control_body_on_new_line
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

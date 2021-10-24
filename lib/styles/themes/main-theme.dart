import 'package:flutter/material.dart';

final Map<int, Color> mainBlackTheme = {
  900: Color(0xff212121),
  800: Color(0xff424242),
  700: Color(0xff616161),
  600: Color(0xff757575),
  500: Color(0xff9e9e9e),
  400: Color(0xffbdbdbd),
  300: Color(0xffe0e0e0),
  200: Color(0xffeeeeee),
  100: Color(0xfff5f5f5),
  50: Color(0xfffafafa),
};

final MaterialColor mainThemeColor =
    MaterialColor(mainBlackTheme[800]!.value, mainBlackTheme);

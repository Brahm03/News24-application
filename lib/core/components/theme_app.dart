import 'package:flutter/material.dart';
import 'package:prac1/core/constants/colorConst.dart';
class Themeapp {
  static get light => ThemeData(
    colorScheme: const ColorScheme.light(
      primary: ColorsConst.white,
      brightness: Brightness.light
    )
  );
  static get dark => ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: ColorsConst.white,
      brightness: Brightness.dark
    )
  );
}
import 'package:flutter/material.dart';
import 'package:talentz/constants/color_manger.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          background: ColorManager.darkBg,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorManager.darkBg,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      );
}

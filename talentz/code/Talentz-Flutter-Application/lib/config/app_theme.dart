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
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: ColorManager.onPrimaryLight),
      dividerTheme: DividerThemeData(
        color: ColorManager.grey1,
        thickness: 1,
      ),
      chipTheme: ChipThemeData(
        side: BorderSide(color: ColorManager.grey1),
      ));
}

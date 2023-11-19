import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_manger.dart';
import '../../constants/font_manager.dart';
import '../../constants/style_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.width,
      required this.isLight,
      required this.text});
  final void Function()? onTap;
  final String text;
  final double width;
  final bool isLight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46.h,
        width: width.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ColorManager.primaryLight, ColorManager.onPrimaryLight],
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: getBoldStyle(
                  color: ColorManager.white, fontSize: FontSize.s16)),
        ),
      ),
    );
  }
}

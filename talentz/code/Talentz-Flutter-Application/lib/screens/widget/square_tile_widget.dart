import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_manger.dart';
import '../../constants/constants.dart';
import '../../constants/font_manager.dart';

class SquareTileWidget extends HookWidget {
  const SquareTileWidget({
    super.key,
    required this.onTap,
    required this.name,
    this.icon,
  });

  final String name;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorManager.onPrimaryLight),
          color: ColorManager.white.withOpacity(0.05),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, color: ColorManager.text, size: FontSize.s36),
                kSizedBox10,
              ],
              Text(
                name,
                style: const TextStyle(
                  color: ColorManager.text,
                  fontSize: FontSize.s16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

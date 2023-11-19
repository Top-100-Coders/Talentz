import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talentz/constants/style_manager.dart';
import 'package:talentz/constants/values_manger.dart';
import 'package:talentz/utils/global_keys.dart';

import 'color_manger.dart';

const kDivider = Divider(
  color: Color(0xFFDEDEDE),
  endIndent: 20,
  indent: 20,
  thickness: 1,
);

const kSizedBox = SizedBox();
SizedBox kSizedBox2 = SizedBox(
  height: 2.h,
);
SizedBox kSizedBox4 = SizedBox(
  height: 4.h,
);
SizedBox kSizedBox5 = SizedBox(
  height: 5.h,
);
SizedBox kSizedBox8 = SizedBox(
  height: 8.h,
);
SizedBox kSizedBox10 = SizedBox(
  height: 10.h,
);
SizedBox kSizedBox12 = SizedBox(
  height: 12.h,
);
SizedBox kSizedBox14 = SizedBox(
  height: 14.h,
);
SizedBox kSizedBox15 = SizedBox(
  height: 15.h,
);
SizedBox kSizedBox16 = SizedBox(
  height: 16.h,
);
SizedBox kSizedBox18 = SizedBox(
  height: 18.h,
);
SizedBox kSizedBox20 = SizedBox(
  height: 20.h,
);
SizedBox kSizedBox22 = SizedBox(
  height: 22.h,
);
SizedBox kSizedBox24 = SizedBox(
  height: 24.h,
);
SizedBox kSizedBox25 = SizedBox(
  height: 25.h,
);
SizedBox kSizedBox30 = SizedBox(
  height: 30.h,
);
SizedBox kSizedBox32 = SizedBox(
  height: 32.h,
);
SizedBox kSizedBox35 = SizedBox(
  height: 35.h,
);
SizedBox kSizedBox40 = SizedBox(
  height: 40.h,
);
SizedBox kSizedBox42 = SizedBox(
  height: 42.h,
);
SizedBox kSizedBox50 = SizedBox(
  height: 50.h,
);
SizedBox kSizedBox71 = SizedBox(
  height: 71.h,
);

SizedBox kSizedW5 = SizedBox(
  width: 5.w,
);
SizedBox kSizedW6 = SizedBox(
  width: 6.w,
);
SizedBox kSizedW7 = SizedBox(
  width: 7.w,
);
SizedBox kSizedW10 = SizedBox(
  width: 10.w,
);
SizedBox kSizedW12 = SizedBox(
  width: 12.w,
);
SizedBox kSizedW15 = SizedBox(
  width: 15.w,
);
SizedBox kSizedW20 = SizedBox(
  width: 20.w,
);
SizedBox kSizedW24 = SizedBox(
  width: 24.w,
);
SizedBox kSizedW30 = SizedBox(
  width: 30.w,
);
SizedBox kSizedW100 = SizedBox(
  width: 100.w,
);

//SnackBar
void showSnackBar({required String text, Color? color}) {
  snackbarKey.currentState!.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      margin: const EdgeInsets.symmetric(
          horizontal: AppMargin.m10, vertical: AppMargin.m20),
      content: Text(
        text,
        style: getBoldStyle(color: ColorManager.white),
      ),
    ),
  );
}

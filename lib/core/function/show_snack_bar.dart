import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/colorsapp.dart';
import '../widgets/app_text.dart';

customShowSnackBar(
    {required BuildContext context, required String message, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    width: 70.w,
    behavior: SnackBarBehavior.floating,
    content: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      height: 30.sp,
      decoration: BoxDecoration(
          color: color ?? kColorMainRed,
          borderRadius: BorderRadius.circular(10.sp)),
      child: AppCustomText(
        text: message,
        colorText: kColorWhite,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  ));
}

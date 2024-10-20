import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/colorsapp.dart';
import 'app_button.dart';
import 'app_text.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.onTapYes,
    this.yesButton,
    this.title,
    this.yesWidget,
    this.onTapNo,
    this.findNo = true,
    this.titleWidget,
    this.yesText,
    this.noText,
  });
  final void Function()? onTapYes;
  final Widget? yesWidget;
  final Widget? titleWidget;
  final void Function()? onTapNo;
  final String? title;
  final String? yesText;
  final String? noText;
  final Color? yesButton;
  final bool findNo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
      ),
      content: titleWidget,
      title: title != null
          ? AppCustomText(
              text: title!,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              maxLines: 2,
        textAlign: TextAlign.center,
            )
          : null,
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        findNo
            ? AppCustomeButton(
                width: 45.sp,
                padding: EdgeInsets.symmetric(vertical: 13.sp),
                colorText: kColorWhite,
                textSize: 15.sp,
                colorButton: kColorPlaceholder,
                textWidget: noText ?? "cancel",
                fontWeightText: FontWeight.bold,
                onTap: onTapNo ??
                    () {
                      Navigator.pop(context);
                    },
              )
            : const SizedBox.shrink(),
        yesWidget ??
            AppCustomeButton(
                width: 45.sp,
                padding: EdgeInsets.symmetric(vertical: 13.sp),
                colorText: kColorWhite,
                textSize: 15.sp,
                colorButton: yesButton ?? kColorMain,
                textWidget: yesText ?? "Yes",
                fontWeightText: FontWeight.bold,
                onTap: onTapYes),
      ],
    );
  }
}

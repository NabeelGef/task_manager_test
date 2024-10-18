import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/colorsapp.dart';

class AppCustomCircleAvatarButton extends StatelessWidget {
  const AppCustomCircleAvatarButton({
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    required this.onPressed,
    required this.icon,
    this.iconColor,
    this.iconSize,
  });
  final double? width;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final void Function()? onPressed;
  final IconData icon;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? 30.px,
        height: height ?? 30.px,
        decoration: BoxDecoration(
            color: backgroundColor?.withOpacity(0.8) ??
                kColorOffWhite,
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          icon,
          color: iconColor ?? kColorMain  ,
          size: iconSize ?? 17.px,
        ),
      ),
    );
  }
}

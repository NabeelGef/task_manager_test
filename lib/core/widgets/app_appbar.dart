import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app_text.dart';

class AppCustomAppBar extends StatelessWidget {
  const AppCustomAppBar({
    super.key,
    this.canPop = false,
    required this.title,
    this.actions,
  });
  final bool canPop;
  final String title;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: 35.sp,
      toolbarHeight: 160.sp,
      actions: actions,
      leading: canPop
          ? InkWell(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
              ))
          : null,
      automaticallyImplyLeading: false,
      centerTitle: true,
      scrolledUnderElevation: 0,
      clipBehavior: Clip.none,
      title: Padding(
        padding: EdgeInsets.only(bottom: 10.sp),
        child: AppCustomText(
          text: title,
          fontSize: 18.sp,
          colorText: Theme.of(context).textTheme.labelSmall!.color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

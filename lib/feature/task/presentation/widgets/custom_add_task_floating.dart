import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constant/colorsapp.dart';
import 'alert_add_task.dart';

class CustomAddTaskFloating extends StatelessWidget {
  const CustomAddTaskFloating({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertAddTask();
            });
      },
      child: Container(
        padding: EdgeInsets.all(15.sp),
        decoration:
        const BoxDecoration(shape: BoxShape.circle, color: kColorMain),
        child: Icon(
          Icons.add,
          color: kColorWhite,
          size: 25.sp,
        ),
      ),
    );
  }
}

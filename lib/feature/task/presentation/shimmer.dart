import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_manager/core/widgets/app_shimmer.dart';

class TasksListShimmer extends StatelessWidget {
  const TasksListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return AppCustomShimmer(
              horizontalMargin: 5.w,
              verticalMargin: 2.h,
              width: 20.w,
              height:10.h,radius: 15.sp);
        },
        separatorBuilder: (context, index) => SizedBox(height: 1.h),
        itemCount: 10);
  }
}

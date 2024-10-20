import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_manager/core/constant/colorsapp.dart';
import 'package:task_manager/core/widgets/app_shimmer.dart';

class TasksListShimmer extends StatelessWidget {
  const TasksListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const TaskItemShimmer();
        },
        separatorBuilder: (context, index) => SizedBox(height: 1.h),
        itemCount: 10);
  }
}
class TaskItemShimmer extends StatelessWidget {
  const TaskItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppCustomShimmer(
          horizontalMargin: 3.w,
          verticalMargin: 2.h,
          width: double.infinity,
          height: 10.h,
          radius: 15.sp,
        ),
        Positioned(
          left: 10.w,
          top: 4.5.h,
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(18.sp),
                  decoration: BoxDecoration(
                    color: kColorGrey,
                    shape: BoxShape.circle,
                  )),
              SizedBox(width: 2.w,),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 35.w,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: kColorGrey300,
                          borderRadius: BorderRadius.circular(15.sp),
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                        width: 50.w,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: kColorGrey300,
                          borderRadius: BorderRadius.circular(15.sp),
                        )),
                  ]),
              SizedBox(width: 5.w,),
              Container(
                  width: 5.w,
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    color: kColorGrey,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15.sp),
                  )),
              SizedBox(
                width: 2.w,
              ),
              Container(
                  width: 5.w,
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    color: kColorGrey,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15.sp),
                  )),

            ],
          ),
        ),
      ],
    );
  }
}


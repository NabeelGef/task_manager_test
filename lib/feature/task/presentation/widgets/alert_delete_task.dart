import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_manager/core/strings/messages.dart';

import '../../../../core/constant/approuter.dart';
import '../../../../core/constant/colorsapp.dart';
import '../../../../core/constant/imagepath.dart';
import '../../../../core/function/show_snack_bar.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_dialog.dart';
import '../../../../core/widgets/app_text.dart';
import '../bloc/delete_task_cubit.dart';
import '../bloc/delete_task_state.dart';

class AlertDeleteTask extends StatelessWidget {
  final int taskId;

  const AlertDeleteTask({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
        listener: (context, state) {
      if (state is SuccessDeleteTaskState) {
        context.pushReplacement(AppRouter.tasksScreen);
        customShowSnackBar(
            context: context,
            message: AppMessages.deleteTaskSuccess,
            color: kColorGreen);
      } else if (state is ErrorDeleteTaskState) {
        customShowSnackBar(context: context, message: state.message);
      }
    }, builder: (context, state) {
      return AppDialog(
          title: "${AppMessages.sureDeleteTask.tr()} #$taskId",
          onTapYes: () async {
            BlocProvider.of<DeleteTaskCubit>(context).deleteTask(taskId);
          },
          onTapNo: () => GoRouter.of(context).pop(),
          yesWidget:
          AppCustomeButton(
              padding: EdgeInsets.symmetric(vertical: 1.sp),
              widget: state is LoadingDeleteTaskState
                  ? Lottie.asset(kLottieLoadingWhite)
                  : AppCustomText(
                text: AppMessages.yes,
                colorText: kColorWhite,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
              width: 45.sp,
              height: 27.sp,
              colorButton: kColorMain,
              onTap: () {
                BlocProvider.of<DeleteTaskCubit>(context).deleteTask(taskId);
              })
      );
    });
  }
}

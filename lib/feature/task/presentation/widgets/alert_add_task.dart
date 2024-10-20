import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constant/approuter.dart';
import '../../../../core/constant/colorsapp.dart';
import '../../../../core/constant/imagepath.dart';
import '../../../../core/function/show_snack_bar.dart';
import '../../../../core/strings/messages.dart';
import '../../../../core/util/app_validator.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_dialog.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../bloc/add_task_cubit.dart';
import '../bloc/add_task_state.dart';

class AlertAddTask extends StatelessWidget {
  const AlertAddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      yesWidget: BlocConsumer<AddTaskCubit,AddTaskState>(
          listener: (context, state) {
            if(state is SuccessAddTaskState){
              context.pushReplacement(AppRouter.tasksScreen);
              customShowSnackBar(context: context, message: AppMessages.addTaskSuccess,
                  color: kColorGreen);
            }else if (state is ErrorAddTaskState){
              customShowSnackBar(context: context, message: state.message);
            }
          },
          builder: (context, state) {
            return AppCustomeButton(
                padding: EdgeInsets.symmetric(vertical: 1.sp),
                widget: state is LoadingAddTaskState
                    ? Lottie.asset(kLottieLoadingWhite)
                    : AppCustomText(
                  text: AppMessages.add,
                  colorText: kColorWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
                height: 29.sp,
                colorButton: kColorMain,
                onTap: () {
                  BlocProvider.of<AddTaskCubit>(context).addTask();
                });
          }),
      findNo: false,
      titleWidget: SizedBox(
        height: 20.h,
        child: Form(
          key: BlocProvider.of<AddTaskCubit>(context).formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppCustomText(
                text: AppMessages.addNewTask,
                colorText: kColorMain,
                fontSize: 20.sp,
              ),
              SizedBox(
                height: 5.h,
              ),
              AppCustomTextFormField(
                validator: AppValidator.nameValidator,
                borderColor: kColorMain,
                borderRadius: BorderRadius.circular(10.sp),
                contentPadding: EdgeInsets.all(15.sp),
                controller: BlocProvider.of<AddTaskCubit>(context).taskName,
                hint: AppMessages.taskTitle,
              )
            ],
          ),
        ),
      ),
    );
  }
}

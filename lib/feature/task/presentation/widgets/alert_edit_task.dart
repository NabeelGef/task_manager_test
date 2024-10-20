import 'package:easy_localization/easy_localization.dart';
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
import '../bloc/editTaskBloc/edit_task_cubit.dart';
import '../bloc/editTaskBloc/edit_task_state.dart';

class AlertEditTask extends StatefulWidget {
  final int taskId;
  final String taskName;
  final bool completed;
  const AlertEditTask({super.key,required this.taskId,required this.taskName,required this.completed});

  @override
  State<AlertEditTask> createState() => _AlertEditTaskState();
}

class _AlertEditTaskState extends State<AlertEditTask> {
  @override
  void initState() {
    BlocProvider.of<EditTaskCubit>(context).editTaskName.text = widget.taskName;
    BlocProvider.of<EditTaskCubit>(context).changeIsCompleted(widget.completed);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      yesWidget: BlocConsumer<EditTaskCubit,EditTaskState>(
          listener: (context, state) {
            if(state is SuccessEditTaskState){
              context.pushReplacement(AppRouter.tasksScreen);
              customShowSnackBar(context: context, message: AppMessages.editTaskSuccess,
                  color: kColorGreen);
            }else if (state is ErrorEditTaskState){
              customShowSnackBar(context: context, message: state.message);
            }
          },
          builder: (context, state) {
            return AppCustomeButton(
                padding: EdgeInsets.symmetric(vertical: 1.sp),
                widget: state is LoadingEditTaskState
                    ? Lottie.asset(kLottieLoadingWhite)
                    : AppCustomText(
                  text: AppMessages.edit,
                  colorText: kColorWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
                height: 29.sp,
                colorButton: kColorMain,
                onTap: () {
                  BlocProvider.of<EditTaskCubit>(context).editTask(widget.taskId);
                });
          }),
      findNo: false,
      titleWidget: SizedBox(
        height: 30.h,
        child: Form(
          key: BlocProvider.of<EditTaskCubit>(context).formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppCustomText(
                text: "${AppMessages.editTask.tr()} #${widget.taskId}",
                colorText: kColorMain,
                fontSize: 20.sp,
              ),
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                flex: 5,
                child: AppCustomTextFormField(
                  validator: AppValidator.nameValidator,
                  borderColor: kColorMain,
                  borderRadius: BorderRadius.circular(10.sp),
                  contentPadding: EdgeInsets.all(15.sp),
                  controller: BlocProvider.of<EditTaskCubit>(context).editTaskName,
                  hint: AppMessages.taskTitle,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppCustomText(text: AppMessages.isCompleted),
                    ValueListenableBuilder(
                      valueListenable: BlocProvider.of<EditTaskCubit>(context).taskNotifier.isCompleted,
                        builder: (context,completed,child) {
                        return Switch(
                            activeColor: kColorWhite,
                            activeTrackColor: kColorGreen,
                            inactiveThumbColor: kColorWhite,
                            inactiveTrackColor: kColorMainRed,
                            trackOutlineColor: const WidgetStatePropertyAll(kColorWhite),
                            value:completed,
                            onChanged: (value) {
                              BlocProvider.of<EditTaskCubit>(context).changeIsCompleted(value);
                        });
                      }
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

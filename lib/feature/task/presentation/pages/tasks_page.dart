import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_manager/core/constant/colorsapp.dart';
import 'package:task_manager/core/widgets/app_appbar.dart';
import 'package:task_manager/core/widgets/app_text.dart';
import 'package:task_manager/core/widgets/tryagain_widget.dart';
import 'package:task_manager/feature/task/domain/entities/task.dart';
import 'package:task_manager/feature/task/presentation/bloc/get_all_task_state.dart';
import 'package:task_manager/feature/task/presentation/widgets/alert_delete_task.dart';
import 'package:task_manager/feature/task/presentation/widgets/alert_edit_task.dart';

import '../../../../core/strings/messages.dart';
import '../bloc/get_all_task_cubit.dart';
import '../shimmer.dart';
import '../widgets/custom_add_task_floating.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  void initState() {
    BlocProvider.of<GetAllTaskCubit>(context).fetchTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CustomAddTaskFloating() ,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(8.h),
          child:  AppCustomAppBar(title: AppMessages.myTasks)),
      body: RefreshIndicator(
        onRefresh: () {
          return BlocProvider.of<GetAllTaskCubit>(context).fetchTasks();
        },
        child: BlocBuilder<GetAllTaskCubit, GetAllTaskState>(
            builder: (context, state) {
          if (state is GetTasksState) {
            return buildTasks(state.tasks.length, state.tasks);
          } else if (state is ErrorTaskState) {
            return Center(
              child: TryAgainWidget(onTap: () {
                BlocProvider.of<GetAllTaskCubit>(context).fetchTasks();
              }),
            );
          }
          return const TasksListShimmer();
        }),
      ),
    );
  }

  Widget buildTasks(int length, List<TodoEntity> tasks) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 3.h),
        itemCount: length,
        itemBuilder: (context, index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: kColorMain, width: 1),
            ),
            subtitle: Row(
              children: [
                Expanded(
                  child: AppCustomText(
                      text: tasks[index].todo, colorText: kColorPlaceholder),
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                        return AlertEditTask(taskId: tasks[index].id,taskName:
                        tasks[index].todo,);
                      });
                    },
                    child: const Icon(Icons.edit_square,color: kColorMain,)),
                SizedBox(width: 3.w,),
                GestureDetector(
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDeleteTask(taskId: tasks[index].id);
                      });
                    },
                    child: const Icon(Icons.delete,color: kColorMainRed,)),
                SizedBox(width: 1.w,),

              ],
            ),
            trailing: Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: tasks[index].completed ? kColorGreen : kColorGrey,
              ),
              child: tasks[index].completed ?const Icon(Icons.check,color: kColorWhite)
              :const Icon(Icons.remove,color: kColorWhite),
            ),
            title: AppCustomText(text: "#${tasks[index].id.toString()}"),
          );
        },
      ),
    );
  }
}

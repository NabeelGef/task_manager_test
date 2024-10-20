import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_manager/core/constant/colorsapp.dart';
import 'package:task_manager/core/constant/imagepath.dart';
import 'package:task_manager/core/widgets/app_appbar.dart';
import 'package:task_manager/core/widgets/app_pagination_list.dart';
import 'package:task_manager/core/widgets/app_text.dart';
import 'package:task_manager/core/widgets/tryagain_widget.dart';
import 'package:task_manager/feature/task/domain/entities/task.dart';
import 'package:task_manager/feature/task/presentation/bloc/viewTaskBloc/get_all_task_state.dart';
import 'package:task_manager/feature/task/presentation/widgets/alert_delete_task.dart';
import 'package:task_manager/feature/task/presentation/widgets/alert_edit_task.dart';

import '../../../../core/cubit_public/pagination_cubit.dart';
import '../../../../core/strings/messages.dart';
import '../bloc/viewTaskBloc/get_all_task_cubit.dart';
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
    PaginationCubit.instance
        .onRefresh(BlocProvider.of<GetAllTaskCubit>(context).fetchTasks);
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
          return  PaginationCubit.instance
              .onRefresh(BlocProvider.of<GetAllTaskCubit>(context).fetchTasks);

        },
        child: BlocBuilder<GetAllTaskCubit, GetAllTaskState>(
            builder: (context, state) {
          if (state is GetTasksState) {
            return buildTasks(state.tasks);
          } else if (state is ErrorTaskState) {
            return Center(
              child: TryAgainWidget(onTap: () {
                PaginationCubit.instance
                    .onRefresh(BlocProvider.of<GetAllTaskCubit>(context).fetchTasks);
              }),
            );
          }
          return const TasksListShimmer();
        }),
      ),
    );
  }

  Widget buildTasks(List<TodoEntity> tasks) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          tasks.isEmpty? Center(child: Lottie.asset(kLottieNotFound)):
      AppCustomPaginationList(
        loadingWidget: const TaskItemShimmer(),
          items: tasks,
          itemWidget: tasks.map((task) {
            return
              Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  color: kColorWhite,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kColorMain, width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: task.completed ? kColorGreen : kColorGrey,
                      ),
                      child: task.completed ?const Icon(Icons.check,color: kColorWhite)
                          :const Icon(Icons.remove,color: kColorWhite),
                    ),
                    SizedBox(width: 3.w,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppCustomText(text: "#${task.id.toString()}"),
                          AppCustomText(
                              text: task.todo, colorText: kColorPlaceholder),
                        ],
                      ),
                    ),
                    SizedBox(width: 3.w,),
                    GestureDetector(
                        onTap: () {
                          showDialog(context: context, builder: (context) {
                            return AlertEditTask(taskId: task.id,taskName:
                            task.todo,completed: task.completed,);
                          });
                        },
                        child: const Icon(Icons.edit_square,color: kColorMain,)),
                    SizedBox(width: 3.w,),
                    GestureDetector(
                        onTap: () {
                          showDialog(context: context, builder: (context) {
                            return AlertDeleteTask(taskId: task.id);
                          });
                        },
                        child: const Icon(Icons.delete,color: kColorMainRed,)),
                    SizedBox(width: 1.w,),
                  ],
                ),
              );
          }).toList(),
          paginatedItems: BlocProvider.of<GetAllTaskCubit>(context).items,
          fetchItemsList: BlocProvider.of<GetAllTaskCubit>(context).fetchTasks)
    );
  }
}

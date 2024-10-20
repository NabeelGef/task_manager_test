import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/feature/task/domain/entities/task.dart';
import 'package:task_manager/feature/task/domain/usecases/getAllTasks.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/function/map_failure_to_message.dart';
import 'get_all_task_state.dart';

class GetAllTaskCubit extends Cubit<GetAllTaskState> {
  GetAllTasks getAllTasks;
  GetAllTaskCubit({
    required this.getAllTasks,
  }) : super(InitialTaskState());


  List<TodoEntity> items = [];
  List<TodoEntity> taskItems = [];


  //===========Tasks==========
  Future<void> fetchTasks(int skip) async {
    if (skip == 0) {
      emit(LoadingTaskState());
    }

    final failureOrDoneMessage = await getAllTasks(skip);
    emit(_mapFailureOrPostsToStateTasks(failureOrDoneMessage,skip));
  }

  GetAllTaskState _mapFailureOrPostsToStateTasks(
      Either<Failure, List<TodoEntity>> either,int skip) {
    return either.fold(
      (failure) => ErrorTaskState(message: mapFailureToMessage(failure)),
      (tasks) {
        items.clear();
        items.addAll(tasks);
        if ((skip == 0)) {
          taskItems.clear();
          taskItems.addAll(items);
        } else {
          taskItems.addAll(items);
        }
        return GetTasksState([...taskItems]);},
    );
  }
}

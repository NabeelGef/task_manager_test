import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/feature/task/domain/entities/task.dart';
import 'package:task_manager/feature/task/domain/usecases/getAllTasks.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/function/map_failure_to_message.dart';
import 'get_all_task_state.dart';

class GetAllTaskCubit extends Cubit<GetAllTaskState> {
  GetAllTasks getAllTasks;
  GetAllTaskCubit({
    required this.getAllTasks,
  }) : super(InitialTaskState());

  //===========Tasks==========
  Future<void> fetchTasks() async {
    emit(LoadingTaskState());

    final failureOrDoneMessage = await getAllTasks();
    emit(_mapFailureOrPostsToStateTasks(failureOrDoneMessage));
  }

  GetAllTaskState _mapFailureOrPostsToStateTasks(
      Either<Failure, List<TodoEntity>> either) {
    return either.fold(
      (failure) => ErrorTaskState(message: mapFailureToMessage(failure)),
      (tasks) => GetTasksState(tasks),
    );
  }
}

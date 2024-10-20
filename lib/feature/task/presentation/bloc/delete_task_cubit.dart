import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/feature/task/domain/usecases/deleteTaskUseCase.dart';
import 'package:task_manager/feature/task/presentation/bloc/delete_task_state.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/function/map_failure_to_message.dart';
import '../../domain/entities/task.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit({required this.deleteTaskUseCase}) : super(InitialDeleteTaskState());
  DeleteTaskUseCase deleteTaskUseCase;


  //===========Tasks==========
  Future<void> deleteTask(int taskId) async {
      emit(LoadingDeleteTaskState());
      final failureOrDoneMessage = await deleteTaskUseCase(taskId);
      emit(_mapFailureOrPostsToStateTasks(failureOrDoneMessage));

  }
  DeleteTaskState _mapFailureOrPostsToStateTasks(
      Either<Failure, TodoEntity> either) {
    return either.fold(
          (failure) => ErrorDeleteTaskState(message: mapFailureToMessage(failure)),
          (task) => SuccessDeleteTaskState(todoEntity:task),
    );
  }
}
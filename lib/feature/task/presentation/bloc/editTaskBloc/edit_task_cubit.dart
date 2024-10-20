import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/feature/task/domain/usecases/editTaskUseCase.dart';
import 'package:task_manager/feature/task/presentation/bloc/editTaskBloc/edit_task_state.dart';
import 'package:task_manager/feature/task/presentation/bloc/notifier.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/function/map_failure_to_message.dart';
import '../../../domain/entities/task.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit({required this.editTaskUseCase}) : super(InitialEditTaskState());
  EditTaskUseCase editTaskUseCase;


  TextEditingController editTaskName = TextEditingController();
  TaskNotifier taskNotifier = TaskNotifier();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //===========Tasks==========
  Future<void> editTask(int taskId) async {
    if(formKey.currentState!.validate()) {
      emit(LoadingEditTaskState());
      final failureOrDoneMessage = await editTaskUseCase(taskId,editTaskName.text,taskNotifier.isCompleted.value);
      emit(_mapFailureOrPostsToStateTasks(failureOrDoneMessage));
    }
  }
  changeIsCompleted(bool completed){
    taskNotifier.setIsCompleted(completed);
  }

  EditTaskState _mapFailureOrPostsToStateTasks(
      Either<Failure, TodoEntity> either) {
    return either.fold(
          (failure) => ErrorEditTaskState(message: mapFailureToMessage(failure)),
          (task) => SuccessEditTaskState(todoEntity:task),
    );
  }
}
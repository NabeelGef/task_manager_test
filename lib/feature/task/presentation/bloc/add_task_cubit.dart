import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/function/map_failure_to_message.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/addTaskUseCase.dart';
import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit({required this.addTaskUseCase}) : super(InitialAddTaskState());
  AddTaskUseCase addTaskUseCase;


  TextEditingController taskName = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //===========Tasks==========
  Future<void> addTask() async {
    if(formKey.currentState!.validate()) {
      emit(LoadingAddTaskState());
      final failureOrDoneMessage = await addTaskUseCase(taskName.text);
      emit(_mapFailureOrPostsToStateTasks(failureOrDoneMessage));
    }
  }
  AddTaskState _mapFailureOrPostsToStateTasks(
      Either<Failure, TodoEntity> either) {
    return either.fold(
          (failure) => ErrorAddTaskState(message: mapFailureToMessage(failure)),
          (task) => SuccessAddTaskState(todoEntity:task),
    );
  }
}
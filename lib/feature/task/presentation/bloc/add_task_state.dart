import 'package:equatable/equatable.dart';
import 'package:task_manager/feature/task/domain/entities/task.dart';

abstract class AddTaskState extends Equatable {
  const AddTaskState();
}
class InitialAddTaskState extends AddTaskState {
  @override
  List<Object> get props => [];
}
class LoadingAddTaskState extends AddTaskState {
  @override
  List<Object> get props => [];
}
class ErrorAddTaskState extends AddTaskState {
  final String message;
  const ErrorAddTaskState({required this.message});

  @override
  List<Object?> get props => [message];
}
class SuccessAddTaskState extends AddTaskState {
  final TodoEntity todoEntity;

  const SuccessAddTaskState({required this.todoEntity});

  @override
  List<Object?> get props => [todoEntity];
}
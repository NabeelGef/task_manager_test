import 'package:equatable/equatable.dart';
import 'package:task_manager/feature/task/domain/entities/task.dart';

abstract class EditTaskState extends Equatable {
  const EditTaskState();
}
class InitialEditTaskState extends EditTaskState {
  @override
  List<Object> get props => [];
}
class LoadingEditTaskState extends EditTaskState {
  @override
  List<Object> get props => [];
}
class ErrorEditTaskState extends EditTaskState {
  final String message;
  const ErrorEditTaskState({required this.message});

  @override
  List<Object?> get props => [message];
}
class SuccessEditTaskState extends EditTaskState {
  final TodoEntity todoEntity;

  const SuccessEditTaskState({required this.todoEntity});

  @override
  List<Object?> get props => [todoEntity];
}
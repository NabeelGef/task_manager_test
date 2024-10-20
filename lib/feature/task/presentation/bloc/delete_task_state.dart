import 'package:equatable/equatable.dart';
import 'package:task_manager/feature/task/domain/entities/task.dart';

abstract class DeleteTaskState extends Equatable {
  const DeleteTaskState();
}
class InitialDeleteTaskState extends DeleteTaskState {
  @override
  List<Object> get props => [];
}
class LoadingDeleteTaskState extends DeleteTaskState {
  @override
  List<Object> get props => [];
}
class ErrorDeleteTaskState extends DeleteTaskState {
  final String message;
  const ErrorDeleteTaskState({required this.message});

  @override
  List<Object?> get props => [message];
}
class SuccessDeleteTaskState extends DeleteTaskState {
  final TodoEntity todoEntity;

  const SuccessDeleteTaskState({required this.todoEntity});

  @override
  List<Object?> get props => [todoEntity];
}
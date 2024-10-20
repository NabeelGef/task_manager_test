import 'package:equatable/equatable.dart';
import '../../domain/entities/task.dart';

abstract class GetAllTaskState extends Equatable {
  const GetAllTaskState();

  @override
  List<Object> get props => [];
}
// ============== Tasks state ============

class InitialTaskState extends GetAllTaskState {}

class GetTasksState extends GetAllTaskState {
  final List<TodoEntity> tasks;
  const GetTasksState(this.tasks);
  @override
  List<Object> get props => [tasks];
}

class LoadingTaskState extends GetAllTaskState {}

class ErrorTaskState extends GetAllTaskState {
  final String message;

  const ErrorTaskState({required this.message});

  @override
  List<Object> get props => [message];
}
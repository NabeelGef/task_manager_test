import 'package:dartz/dartz.dart';
import 'package:task_manager/feature/task/domain/entities/task.dart';

import '../../../../core/error/failure.dart';


abstract class TaskRepo {
  Future<Either<Failure, List<TodoEntity>>> getAllTasks(int skip);
  Future<Either<Failure, TodoEntity>> addTask(String taskName);
  Future<Either<Failure, TodoEntity>> editTask(int taskId,String taskName , bool isCompleted);
  Future<Either<Failure, TodoEntity>> deleteTask(int taskId);
}

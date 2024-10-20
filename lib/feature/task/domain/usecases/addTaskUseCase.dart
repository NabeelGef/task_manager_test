import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';
import '../repositories/task_repositories.dart';

class AddTaskUseCase {

  final TaskRepo taskRepo;

  AddTaskUseCase(this.taskRepo);

  Future<Either<Failure,TodoEntity>> call(String taskName){
    return taskRepo.addTask(taskName);
  }
}
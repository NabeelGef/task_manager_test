import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';
import '../repositories/task_repositories.dart';

class DeleteTaskUseCase {

  final TaskRepo taskRepo;

  DeleteTaskUseCase(this.taskRepo);

  Future<Either<Failure,TodoEntity>> call(int taskId){
    return taskRepo.deleteTask(taskId);
  }
}
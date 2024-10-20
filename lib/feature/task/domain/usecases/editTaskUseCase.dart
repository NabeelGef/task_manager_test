import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';
import '../repositories/task_repositories.dart';

class EditTaskUseCase {

  final TaskRepo taskRepo;

  EditTaskUseCase(this.taskRepo);

  Future<Either<Failure,TodoEntity>> call(int taskId,String taskName , bool isCompleted){
    return taskRepo.editTask(taskId,taskName,isCompleted);
  }
}
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';
import '../repositories/task_repositories.dart';

class GetAllTasks{

  final TaskRepo taskRepo;

  GetAllTasks(this.taskRepo);

  Future<Either<Failure,List<TodoEntity>>> call(int skip){
    return taskRepo.getAllTasks(skip);
  }

}
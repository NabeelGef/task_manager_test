import 'package:dartz/dartz.dart';
import 'package:task_manager/feature/task/domain/entities/task.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/task_repositories.dart';
import '../datasource/task_remote_data_source.dart';

class TaskRepositoriesImpl implements TaskRepo {
  final TaskRemoteDataSource taskRemoteDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoriesImpl({
        required this.taskRemoteDataSource,
        required this.networkInfo});
  @override
  Future<Either<Failure, List<TodoEntity>>> getAllTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await taskRemoteDataSource.getAllTasks();
        return Right(remote);
      } on ServerException catch(e){
        return Left(ServerFailure(message: e.message , statusCode: e.statusCode));
      }
    }
    return Left(OfflineFailure());
    /*else {
      try {
        final local = await taskLocalDataSource.getAllCategoriesCached();
        return Right(local);
      } on EmptyCacheFailure {
        return Left(OfflineFailure());
      }
    }*/
  }

  @override
  Future<Either<Failure, TodoEntity>> addTask(String taskName) async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await taskRemoteDataSource.addTask(taskName);
        return Right(remote);
      } on ServerException catch(e){
        return Left(ServerFailure(message: e.message , statusCode: e.statusCode));
      }
    }
    return Left(OfflineFailure());
  }

  @override
  Future<Either<Failure, TodoEntity>> deleteTask(int taskId) async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await taskRemoteDataSource.deleteTask(taskId);
        return Right(remote);
      } on ServerException catch(e){
        return Left(ServerFailure(message: e.message , statusCode: e.statusCode));
      }
    }
    return Left(OfflineFailure());
  }

  @override
  Future<Either<Failure, TodoEntity>> editTask(int taskId, String taskName, bool isCompleted) async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await taskRemoteDataSource.editTask(taskId,taskName,isCompleted);
        return Right(remote);
      } on ServerException catch(e){
        return Left(ServerFailure(message: e.message , statusCode: e.statusCode));
      }
    }
    return Left(OfflineFailure());
  }
}

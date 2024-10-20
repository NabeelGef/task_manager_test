import 'package:dartz/dartz.dart';
import 'package:task_manager/core/storage/storage_handler.dart';
import 'package:task_manager/feature/task/domain/entities/task.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/task_repositories.dart';
import '../datasource/task_local_data_source.dart';
import '../datasource/task_remote_data_source.dart';

class TaskRepositoriesImpl implements TaskRepo {
  final TaskRemoteDataSource taskRemoteDataSource;
  final TaskLocalDataSource taskLocalDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoriesImpl({
        required this.taskRemoteDataSource,
        required this.taskLocalDataSource,
        required this.networkInfo});
  @override
  Future<Either<Failure, List<TodoEntity>>> getAllTasks(int skip) async {
    StorageHandler().setSkipPage(skip);
    if (await networkInfo.isConnected) {
      try {
        if(skip==0){
            await taskLocalDataSource.deleteAllTasksLocal();
        }
        final localTasks = await taskLocalDataSource.getAllTasksLocal();
        if(localTasks.isNotEmpty&&skip<localTasks.length){
          skip = localTasks.length;
        }
        final remote = await taskRemoteDataSource.getAllTasks(skip);
        final updatedTasks = [...localTasks, ...remote];
        await taskLocalDataSource.storeTasksLocal(updatedTasks);
        return Right(remote);
      } on ServerException catch(e){
        return Left(ServerFailure(message: e.message , statusCode: e.statusCode));
      }
    }
    else {
        if(skip==0) {
          final local = await taskLocalDataSource.getAllTasksLocal();
          return Right(local);
        }else {
          return const Right([]);
        }
    }
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


import 'package:task_manager/core/error/exceptions.dart';
import 'package:task_manager/core/storage/storage_handler.dart';
import 'package:task_manager/feature/task/data/models/task_model.dart';

import '../../../../core/network/network_helper.dart';
import '../../../../core/strings/apis.dart';
import '../../../../core/util/app_response.dart';

abstract class TaskRemoteDataSource {
  Future<List<TodoModel>> getAllTasks();
  Future<TodoModel> addTask(String taskName);
  Future<TodoModel> editTask(int taskId,String taskName , bool isCompleted);
  Future<TodoModel> deleteTask(int taskId);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  @override
  Future<List<TodoModel>> getAllTasks() async {
    AppResponse response = await NetworkHelper().get(ApisWords.tasks);
    return response.toListTodo((json) => TodoModel.fromJson(json));
  }

  @override
  Future<TodoModel> addTask(String taskName) async {
    AppResponse response = await NetworkHelper().post(ApisWords.addTasks,
    body: {
      'todo': taskName,
      "completed": false,
      "userId": StorageHandler().userId,
    }
    );
    if(response.statusCode == 201) {
      return TodoModel.fromJson(response.data);
    }
    throw OfflineException();
  }
  @override
  Future<TodoModel> editTask(int taskId,String taskName , bool isCompleted) async {
    AppResponse response = await NetworkHelper().put("${ApisWords.tasks}/$taskId",
    body: {
      'todo': taskName,
      "completed": isCompleted,
      "userId": StorageHandler().userId,
    }
    );
    if(response.statusCode == 200) {
      return TodoModel.fromJson(response.data);
    }
    throw OfflineException();
  }
  @override
  Future<TodoModel> deleteTask(int taskId) async {
    AppResponse response = await NetworkHelper().delete("${ApisWords.tasks}/$taskId");
    if(response.statusCode == 200) {
      return TodoModel.fromJson(response.data);
    }
    throw OfflineException();
  }
}

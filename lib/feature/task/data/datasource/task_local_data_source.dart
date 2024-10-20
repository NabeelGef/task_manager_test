
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:task_manager/core/storage/storage_handler.dart';
import 'package:task_manager/feature/task/data/models/task_model.dart';


abstract class TaskLocalDataSource {
  Future<List<TodoModel>> getAllTasksLocal();
  Future<Unit> storeTasksLocal(List<TodoModel> tasks);
  Future<Unit> deleteAllTasksLocal();
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  @override
  Future<Unit> storeTasksLocal(List<TodoModel> tasks) {
    List todoToJson = tasks
        .map<Map<String, dynamic>>(
            (todosModel) => todosModel.toJson())
        .toList();
    return StorageHandler().setTask(todoToJson);
  }

  @override
  Future<List<TodoModel>> getAllTasksLocal() async {
    String? tasks = StorageHandler().taskItems;
    if(tasks!=null){
      List decodeJsonData = json.decode(tasks);
      List<TodoModel> tasksList = decodeJsonData.map((e) =>
          TodoModel.fromJson(e)).toList();
    return Future.value(tasksList);
    }
    return Future.value([]);
  }
  @override
  Future<Unit> deleteAllTasksLocal() async {
    return StorageHandler().removeTasks();
  }
}

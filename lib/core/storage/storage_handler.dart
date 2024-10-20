

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../strings/words.dart';

class StorageHandler {
  StorageHandler._();
  static StorageHandler? _instance;
  factory StorageHandler() => _instance ??= StorageHandler._();
  static String language = "English";
  late SharedPreferences storage;

  Future<void> init() async {
    storage = await SharedPreferences.getInstance();
  }

  Future<void> setToken(String token) => storage.setString(Words.token,token);
  Future<void> setUserId(int userId) => storage.setInt(Words.userId,userId);
  Future<void> setSkipPage(int skip) => storage.setInt(Words.skipPage,skip);


//================Auth===============

  String? get accessToken => storage.getString(Words.token);
  String? get taskItems => storage.getString(Words.task);
  int? get userId => storage.getInt(Words.userId);
  int? get skipPage => storage.getInt(Words.skipPage);

  //================Task===============
  Future<Unit> setTask(List task) {
    storage.setString(
        Words.task,json.encode(task));
    return Future.value(unit);
  }
  Future<Unit> removeTasks() {
    storage.remove(Words.task);
    return Future.value(unit);
  }
}

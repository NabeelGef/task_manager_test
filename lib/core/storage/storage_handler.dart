

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


//================Auth===============

  String? get accessToken => storage.getString(Words.token);
  int? get userId => storage.getInt(Words.userId);
}

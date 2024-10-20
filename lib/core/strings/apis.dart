class ApisWords {
  static String get BASEURL => "https://dummyjson.com";

// =============Auth=========
  static String get login => "/auth/login";

  //=========== Tasks =======

  static String get tasks => "/todos";
  static String get addTasks => "$tasks/add";

}

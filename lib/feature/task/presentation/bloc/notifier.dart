
import 'package:flutter/cupertino.dart';

class TaskNotifier{

  ValueNotifier<bool> isCompleted = ValueNotifier(false);

  setIsCompleted(bool completed){
    isCompleted.value  = completed;
  }
}
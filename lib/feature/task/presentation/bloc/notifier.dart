
import 'package:flutter/material.dart';

class TaskNotifier{

  final ValueNotifier<bool> isCompleted = ValueNotifier<bool>(false);

  setIsCompleted(bool completed){
    isCompleted.value  = completed;
  }
}
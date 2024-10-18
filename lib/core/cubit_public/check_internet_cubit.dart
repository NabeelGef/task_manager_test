import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CheckInternetCubit extends Cubit<bool> {
  CheckInternetCubit() : super(true);
  checkInternet(BuildContext context) {
    StreamSubscription<InternetConnectionStatus> listener =
        InternetConnectionChecker().onStatusChange.listen((status) async {
      switch (status) {
        case InternetConnectionStatus.connected:
          emit(true);
          print("return Net");
          break;
        case InternetConnectionStatus.disconnected:
          emit(false);
        
          print("poooooooooooooooooooooo");
          break;
        default:
      }
    });
  }
}
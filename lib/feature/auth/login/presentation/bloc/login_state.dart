import 'package:equatable/equatable.dart';

class LoginState extends Equatable{
  @override
  List<Object> get props =>[];
}

class InitialLoginState extends LoginState{}

class LoadingLoginState extends LoginState{}

class ErrorLoginState extends LoginState{
  final String message;

  ErrorLoginState({required this.message});

  @override
  List<Object> get props =>[message];
}

class MessageSuccessLoginState extends LoginState{
  final int id;

  MessageSuccessLoginState({required this.id});

  @override
  List<Object> get props =>[id];
}



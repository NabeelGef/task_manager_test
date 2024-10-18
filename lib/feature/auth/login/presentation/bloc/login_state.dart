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
  final String accessToken;

  MessageSuccessLoginState({required this.accessToken});

  @override
  List<Object> get props =>[accessToken];
}



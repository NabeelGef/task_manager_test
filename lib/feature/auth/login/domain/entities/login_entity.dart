import 'package:equatable/equatable.dart';

abstract class LoginEntity extends Equatable{
  final String userName;
  final String password;

  const LoginEntity({
    required this.userName,
    required this.password,
  });

  @override
  List<Object> get props => [userName,password];

  Map<String, dynamic> toJson();
}
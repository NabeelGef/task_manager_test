
import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity{
  const LoginModel({required super.userName, required super.password});

  @override
  Map<String, dynamic> toJson() {
   return {
     "username":userName,
     "password":password
   };
  }
}
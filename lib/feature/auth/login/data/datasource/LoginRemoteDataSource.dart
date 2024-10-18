import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../core/strings/apis.dart';
import '../../../../../core/util/app_response.dart';
import '../model/LoginModel.dart';

abstract class LoginRemoteDataSource {
  Future<String> login(LoginModel loginModel);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{
  @override
  Future<String> login(LoginModel loginModel) async {
    AppResponse response = await NetworkHelper().post(ApisWords.login, body: loginModel.toJson());
    if(response.statusCode == 200){
      return Future.value(response.data["accessToken"]);
    }else{
      throw ServerException(message: response.data["message"], statusCode: response.statusCode!);
    }
  }
}
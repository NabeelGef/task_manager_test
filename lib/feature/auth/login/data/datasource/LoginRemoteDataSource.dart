import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../core/strings/apis.dart';
import '../../../../../core/util/app_response.dart';
import '../model/LoginModel.dart';

abstract class LoginRemoteDataSource {
  Future<int> login(LoginModel loginModel);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{
  @override
  Future<int> login(LoginModel loginModel) async {
    AppResponse response = await NetworkHelper().post(ApisWords.login, body: loginModel.toJson());
    if(response.statusCode == 200){
      return Future.value(response.data["id"]);
    }else{
      throw ServerException(message: response.data["message"], statusCode: response.statusCode!);
    }
  }
}
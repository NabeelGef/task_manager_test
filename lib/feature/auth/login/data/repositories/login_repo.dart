import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repositories.dart';
import '../datasource/LoginRemoteDataSource.dart';
import '../model/LoginModel.dart';

class LoginRepositoriesImpl implements LoginRepositories {
  LoginRemoteDataSource loginRemoteDataSourceImpl;
  final NetworkInfo networkInfo;

  LoginRepositoriesImpl(
      {required this.loginRemoteDataSourceImpl, required this.networkInfo});

  @override
  Future<Either<Failure, String>> login(LoginEntity loginEntity) async {
    LoginModel loginModel =
        LoginModel(userName: loginEntity.userName, password: loginEntity.password);
    if (await networkInfo.isConnected) {
      try {
        final remote = await loginRemoteDataSourceImpl.login(loginModel);
        return Right(remote);
      } on ServerException  catch (e){
        return Left(ServerFailure(message:e.message , statusCode: e.statusCode));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}

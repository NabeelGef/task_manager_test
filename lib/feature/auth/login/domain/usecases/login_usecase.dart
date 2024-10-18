import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repositories.dart';

class LoginUseCase {
  LoginRepositories loginRepositories;

  LoginUseCase(this.loginRepositories);

  Future<Either<Failure, String>> call(LoginEntity loginEntity) {
    return loginRepositories.login(loginEntity);
  }
}

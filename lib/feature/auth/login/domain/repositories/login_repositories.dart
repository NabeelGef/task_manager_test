import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/login_entity.dart';

abstract class LoginRepositories {
  Future<Either<Failure,String>> login(LoginEntity loginEntity);
}
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/categories.dart';
import '../repositories/home_repositories.dart';

class GetAllCategories {
  final HomeRepo homeRepo;

  GetAllCategories(this.homeRepo);

  Future<Either<Failure, List<CategoriesEntity>>> call() {
    return homeRepo.getAllCategories();
  }
}

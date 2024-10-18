import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/most_sale.dart';
import '../repositories/home_repositories.dart';

class GetAllMostSale {
  final HomeRepo homeRepo;

  GetAllMostSale(this.homeRepo);

  Future<Either<Failure, List<MostSaleEntity>>> call() {
    return homeRepo.getAllMostSale();
  }
}

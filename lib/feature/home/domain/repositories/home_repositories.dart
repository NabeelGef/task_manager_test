import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/categories.dart';
import '../entities/most_sale.dart';
import '../entities/sliders.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoriesEntity>>> getAllCategories();
  Future<Either<Failure, List<SliderEntity>>> getAllSliders();
  Future<Either<Failure, List<MostSaleEntity>>> getAllMostSale();
}

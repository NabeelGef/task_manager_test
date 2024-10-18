/*
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/categories.dart';
import '../../domain/entities/most_sale.dart';
import '../../domain/entities/sliders.dart';
import '../../domain/repositories/home_repositories.dart';
import '../datasource/home_local_data_source.dart';
import '../datasource/home_remote_data_source.dart';

class HomeRepositoriesImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoriesImpl(
      {required this.homeRemoteDataSource,
      required this.homeLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<CategoriesEntity>>> getAllCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await homeRemoteDataSource.getAllCategories();
        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await homeLocalDataSource.getAllCategoriesCached();
        return Right(local);
      } on EmptyCacheFailure {
        return Left(OfflineFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<SliderEntity>>> getAllSliders() async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await homeRemoteDataSource.getAllSliders();
        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await homeLocalDataSource.getAllSlidersCached();
        return Right(local);
      } on EmptyCacheFailure {
        return Left(OfflineFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MostSaleEntity>>> getAllMostSale() async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await homeRemoteDataSource.getAllMostSale();
        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await homeLocalDataSource.getAllMostSaleCached();
        return Right(local);
      } on EmptyCacheFailure {
        return Left(OfflineFailure());
      }
    }
  }
}
*/

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/strings/failures.dart';
import '../../domain/entities/categories.dart';
import '../../domain/entities/most_sale.dart';
import '../../domain/entities/sliders.dart';
import '../../domain/usecases/getAllSliders.dart';
import '../../domain/usecases/get_all_categories.dart';
import '../../domain/usecases/getall_mostsale.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetAllCategories getAllCategoriesUseCase;
  GetAllSliders getAllSlidersUseCase;
  GetAllMostSale getAllMostSaleUseCase;

  HomeCubit({
    required this.getAllSlidersUseCase,
    required this.getAllMostSaleUseCase,
    required this.getAllCategoriesUseCase,
  }) : super(InitialCategoriesState());

//===========Categories==========
  Future<void> fetchCategories() async {
    emit(LoadingCategoriesState());

    final failureOrDoneMessage = await getAllCategoriesUseCase();
    emit(_mapFailureOrPostsToStateCategories(failureOrDoneMessage));
  }

  HomeState _mapFailureOrPostsToStateCategories(
      Either<Failure, List<CategoriesEntity>> either) {
    return either.fold(
      (failure) => ErrorCategoriesState(message: _mapFailureToMessage(failure)),
      (categories) => GetCategoriesState(categories),
    );
  }

//==========sliders==========
  Future<void> fetchSliders() async {
    emit(LoadingSlidersState());

    final failureOrDoneMessage = await getAllSlidersUseCase();
    emit(_mapFailureOrPostsToStateSliders(failureOrDoneMessage));
  }

  HomeState _mapFailureOrPostsToStateSliders(
      Either<Failure, List<SliderEntity>> either) {
    return either.fold(
      (failure) => ErrorSlidersState(message: _mapFailureToMessage(failure)),
      (sliders) => GetSlidersState(sliders),
    );
  }

//==========Most-Sale==========

  Future<void> fetchMostSales() async {
    emit(LoadingMostSaleState());

    final failureOrDoneMessage = await getAllMostSaleUseCase();
    emit(_mapFailureOrPostsToStateMostSales(failureOrDoneMessage));
  }

  HomeState _mapFailureOrPostsToStateMostSales(
      Either<Failure, List<MostSaleEntity>> either) {
    return either.fold(
      (failure) => ErrorMostSaleState(message: _mapFailureToMessage(failure)),
      (mostsale) => GetMostSaleState(mostsale),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return FailureMessages.error;
      case const (EmptyCacheFailure):
        return FailureMessages.noData;
      case const (OfflineFailure):
        return FailureMessages.noInternet;
      default:
        return FailureMessages.unexpected;
    }
  }
}

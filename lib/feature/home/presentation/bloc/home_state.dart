import 'package:equatable/equatable.dart';

import '../../domain/entities/categories.dart';
import '../../domain/entities/most_sale.dart';
import '../../domain/entities/sliders.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}
// ============== Categories state ============

class InitialCategoriesState extends HomeState {}

class GetCategoriesState extends HomeState {
  List<CategoriesEntity> categories;
  GetCategoriesState(this.categories);
  @override
  List<Object> get props => [categories];
}

class LoadingCategoriesState extends HomeState {}

class ErrorCategoriesState extends HomeState {
  String message;

  ErrorCategoriesState({required this.message});

  @override
  List<Object> get props => [message];
}

// ============== Sliders state ============

class InitialSlidersState extends HomeState {}

class GetSlidersState extends HomeState {
  List<SliderEntity> slider;
  GetSlidersState(this.slider);
  @override
  List<Object> get props => [slider];
}

class LoadingSlidersState extends HomeState {}

class ErrorSlidersState extends HomeState {
  String message;

  ErrorSlidersState({required this.message});

  @override
  List<Object> get props => [message];
}

//========= Most_Sale State ==========

class InitialMostSaleState extends HomeState {}

class GetMostSaleState extends HomeState {
  List<MostSaleEntity> mostSale;
  GetMostSaleState(this.mostSale);
  @override
  List<Object> get props => [mostSale];
}

class LoadingMostSaleState extends HomeState {}

class ErrorMostSaleState extends HomeState {
  String message;

  ErrorMostSaleState({required this.message});

  @override
  List<Object> get props => [message];
}

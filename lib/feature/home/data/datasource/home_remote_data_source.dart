/*

import '../../../../core/network/network_helper.dart';
import '../../../../core/strings/apis.dart';
import '../../../../core/util/app_response.dart';
import '../../domain/entities/categories.dart';
import 'package:dio/dio.dart' as dio;

import '../models/categories_model.dart';
import '../models/mostsale_model.dart';
import '../models/sliders_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoriesModel>> getAllCategories();
  Future<List<SlidersModel>> getAllSliders();
  Future<List<MostSaleModel>> getAllMostSale();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<CategoriesModel>> getAllCategories() async {
    AppResponse response = await NetworkHelper().get(ApisWords.categories);
    return response.toList((json) => CategoriesModel.fromJson(json));
  }

  @override
  Future<List<SlidersModel>> getAllSliders() async {
    AppResponse response = await NetworkHelper().get(ApisWords.sliders);
    return response.toList((json) => SlidersModel.fromJson(json));
  }

  @override
  Future<List<MostSaleModel>> getAllMostSale() async {
    AppResponse response = await NetworkHelper().get(ApisWords.mostsale);
    return response.toList((json) => MostSaleModel.fromJson(json));
  }
}
*/

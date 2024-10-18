import 'dart:js_interop';

import '../../domain/entities/categories.dart';

class CategoriesModel extends CategoriesEntity{
  CategoriesModel({required super.id, required super.nameCategory, required super.imageCategory});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
        id: json["id"],
        nameCategory: json["name_category"],
        imageCategory: json["image_category"]
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "name_category":nameCategory,
      "image_category":imageCategory
    };
  }
}
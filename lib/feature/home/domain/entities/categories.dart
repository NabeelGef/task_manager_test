
import 'package:equatable/equatable.dart';

abstract class CategoriesEntity extends Equatable{

  int id;
  String nameCategory;
  String imageCategory;

  CategoriesEntity({required this.id , required this.nameCategory,required this.imageCategory});

  @override
  List<Object?> get props => [id,nameCategory,imageCategory];

  Map<String, dynamic> toJson();


}
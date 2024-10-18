import 'package:equatable/equatable.dart';

abstract class MostSaleEntity extends Equatable {
  int id;
  String imageMostsale;
  String titleMostsale;
  double priceMostsale;

  MostSaleEntity({
    required this.id,
    required this.imageMostsale,
    required this.titleMostsale,
    required this.priceMostsale,
  });

  @override
  List<Object?> get props => [id, imageMostsale, titleMostsale, priceMostsale];

  Map<String, dynamic> toJson();
}

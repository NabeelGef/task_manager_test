
import '../../domain/entities/most_sale.dart';

class MostSaleModel extends MostSaleEntity {
  MostSaleModel(
      {required super.imageMostsale,
      required super.titleMostsale,
      required super.priceMostsale,
      required super.id});

  factory MostSaleModel.fromJson(Map<String, dynamic> json) {
    return MostSaleModel(
        id: json["id"],
        imageMostsale: json["image_mostsale"],
        titleMostsale: json["title_mostsale"],
        priceMostsale: json["price_mostsale"]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image_mostsale": imageMostsale,
      "title_mostsale": titleMostsale,
      "price_mostsale": priceMostsale
    };
  }
}

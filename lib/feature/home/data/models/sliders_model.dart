
import '../../domain/entities/sliders.dart';

class SlidersModel extends SliderEntity {
  SlidersModel({required super.imageSliders, required super.id});
  @override
  Map<String, dynamic> toJson() {
    return {
      'image_slider': imageSliders,
      'id': id,
    };
  }

  factory SlidersModel.fromJson(Map<String, dynamic> json) {
    return SlidersModel(
      imageSliders: json['image_slider'],
      id: json['image_slider'],
    );
  }
}

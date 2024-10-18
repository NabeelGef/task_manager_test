import 'package:equatable/equatable.dart';

abstract class SliderEntity extends Equatable {
  int id;
  String imageSliders;
  SliderEntity({required this.id, required this.imageSliders});
  @override
  // TODO: implement props
  List<Object?> get props => [id, imageSliders];
  Map<String, dynamic> toJson();
}

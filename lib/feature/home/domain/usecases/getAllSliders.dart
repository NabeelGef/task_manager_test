import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/sliders.dart';
import '../repositories/home_repositories.dart';

class GetAllSliders{

  final HomeRepo homeRepo;

  GetAllSliders(this.homeRepo);

  Future<Either<Failure,List<SliderEntity>>> call(){
    return homeRepo.getAllSliders();
  }

}
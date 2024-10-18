import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final String message;
  final int statusCode;
  ServerFailure({required this.statusCode,required this.message});
  @override
  List<Object?> get props => [message,statusCode];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
import '../error/failure.dart';
import '../strings/failures.dart';
String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case const (ServerFailure):
      final  serverFailure = failure as ServerFailure;
      return serverFailure.message;
    case const (OfflineFailure) || const (EmptyCacheFailure) :
      return FailureMessages.noInternet;
    default:
      return FailureMessages.unexpected;
  }
}
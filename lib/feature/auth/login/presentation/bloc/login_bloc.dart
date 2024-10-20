import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/function/map_failure_to_message.dart';
import '../../data/model/LoginModel.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginUseCase loginUseCase;

  LoginCubit({
    required this.loginUseCase,
  }):super(InitialLoginState());

  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    if(formState.currentState!.validate()){
      emit(LoadingLoginState());
      LoginModel loginModel = LoginModel(userName: userName.text , password: password.text);
      final failureOrDoneMessage = await loginUseCase(loginModel);
      emit(_mapFailureOrPostsToStateLogin(failureOrDoneMessage));

    }
  }
  LoginState _mapFailureOrPostsToStateLogin(
      Either<Failure, int> either) {
    return either.fold(
          (failure) => ErrorLoginState(message: mapFailureToMessage(failure)),
          (id) => MessageSuccessLoginState(id: id),
    );
  }
}
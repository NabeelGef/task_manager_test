import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_manager/core/constant/approuter.dart';
import 'package:task_manager/core/constant/imagepath.dart';
import 'package:task_manager/core/storage/storage_handler.dart';
import 'package:task_manager/core/strings/messages.dart';

import '../../../../../core/constant/colorsapp.dart';
import '../../../../../core/function/show_snack_bar.dart';
import '../../../../../core/util/app_validator.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:5.w),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is ErrorLoginState) {
              customShowSnackBar(context: context, message: state.message);
            } else if (state is MessageSuccessLoginState) {
                StorageHandler().setToken(state.accessToken);
                context.pushReplacement(AppRouter.tasksScreen);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 35.sp,
                  ),
                  Image.asset(kImageLogo),
                  SizedBox(
                    height: 25.sp,
                  ),
                  buildLoginForm(context),
                  SizedBox(
                    height: 26.sp,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  buildLoginForm(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginCubit>(context).formState,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: AppCustomTextFormField(
              keyboardType: TextInputType.text,
              controller: BlocProvider.of<LoginCubit>(context).userName,
              validator: AppValidator.nameValidator,
              borderRadius: BorderRadius.circular(10),
              hint: AppMessages.userName,
              hintfontSize: 15.sp,
              hintFontWeight: FontWeight.w500,
              colorHint: kColorPlaceholder,
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: AppCustomTextFormField(
              maxLines: 1,
              controller: BlocProvider.of<LoginCubit>(context).password,
              validator: AppValidator.passwordValidator,
              isPass: true,
              passIconColor: kColorPlaceholder,
              borderRadius: BorderRadius.circular(10),
              hint: AppMessages.enterPassword,
              hintfontSize: 15.sp,
              colorHint: kColorPlaceholder,
              hintFontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
            return AppCustomeButton(
              onTap: () {
                BlocProvider.of<LoginCubit>(context).login();
              },
              colorButton: kColorMain,
              widget: state is LoadingLoginState
                  ? Lottie.asset(kLottieLoadingWhite)
                  : AppCustomText(
                      text: AppMessages.signIn,
                      colorText: kColorWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
              colorText: kColorWhite,
              textSize: 14.sp,
              height: 29.sp,
            );
          }),
        ],
      ),
    );
  }
}

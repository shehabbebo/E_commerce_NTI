import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/auth/data/repo/auth_repo.dart';
import 'package:shop/features/auth/data/repo/models/responce_nodel.dart';
import 'package:shop/features/auth/manager/log_in/log_in_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;

  final AuthRepo authRepo = AuthRepo();

  void onLoginPressed() async {
    if (formkey.currentState!.validate()) {
      emit(LoginLoadingState());
      var result = await authRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      result.fold(
        (error) {
          emit(LoginErrorState(error));
        },
        (r) // right
        {
          emit(LoginSuccessState());
        },
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(LoginVisibilityState());
  }
}

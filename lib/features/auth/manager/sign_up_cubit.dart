import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/features/auth/data/repo/auth_repo.dart';
import 'package:shop/features/auth/manager/sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitState());

  static SignupCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AuthRepo authRepo = AuthRepo();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  void onsignUpPressed() async {
    if (formkey.currentState!.validate()) {
      emit(SignupLoadingState());
      var result = await authRepo.register(
        email: emailController.text,
        phone: phoneController.text,
        username: userNameController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );
      result.fold(
        (String error) // left
        {
          emit(SignupErrorState(error));
        },
        (r) // right
        {
          emit(SignupSuccessState());
        },
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(SignupVisibilityState());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    emit(SignupVisibilityState());
  }
}

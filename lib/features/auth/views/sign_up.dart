import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/helper/app_regex.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/string.dart';
import 'package:shop/core/widgets/custom_buttom.dart';
import 'package:shop/core/widgets/custom_text_filed.dart';
import 'package:shop/features/auth/manager/sign_up_cubit.dart';
import 'package:shop/features/auth/manager/sign_up_state.dart';

class SignUp_view extends StatelessWidget {
  const SignUp_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignupCubit(),
          child: BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sign Up Success')),
                );
                Navigator.pushReplacementNamed(
                  context,
                  Routes.SplashScreen_view,
                );
              } else if (state is SignupErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              var cubit = SignupCubit.get(context);
              return Form(
                key: cubit.formkey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Create an\naccount',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppAssets.fontfamily,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormFiled(
                      controller: cubit.userNameController,
                      hintText: 'Full Name',
                      prefixIcon: const Icon(Icons.person_3),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Name is required'
                                  : null,
                    ),
                    const SizedBox(height: 8),
                    CustomTextFormFiled(
                      controller: cubit.phoneController,
                      hintText: 'Phone',
                      prefixIcon: const Icon(Icons.phone_outlined),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone is required';
                        } else if (!AppRegex.isPasswordValid(value)) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomTextFormFiled(
                      controller: cubit.emailController,
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!AppRegex.isEmailValid(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomTextFormFiled(
                      controller: cubit.passwordController,
                      hintText: 'Password',
                      isObscureText: cubit.isPasswordHidden,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.isPasswordHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          cubit.togglePasswordVisibility();
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (!AppRegex.isPasswordValid(value)) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomTextFormFiled(
                      controller: cubit.confirmPasswordController,
                      hintText: 'Confirm Password',
                      isObscureText: cubit.isConfirmPasswordHidden,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.isConfirmPasswordHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          cubit.toggleConfirmPasswordVisibility();
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm your password';
                        } else if (value != cubit.passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "          By clicking ",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.Login_view);
                          },
                          child: Text(
                            "the Register ",
                            style: TextStyle(color: Colors.pink, fontSize: 12),
                          ),
                        ),
                        Text(
                          "button, you agree to the public offer",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomBottom(
                      text: 'Create Account',
                      onPressed: () {
                        if (cubit.formkey.currentState!.validate()) {
                          Navigator.pushNamed(context, Routes.HomeScreenBody);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

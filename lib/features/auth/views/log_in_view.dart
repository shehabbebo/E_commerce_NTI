import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/helper/app_regex.dart';
import 'package:shop/core/utils/string.dart';
import 'package:shop/core/widgets/custom_buttom.dart';
import 'package:shop/core/widgets/custom_text_filed.dart';
import 'package:shop/features/auth/manager/log_in/log_in_cubit.dart';
import 'package:shop/features/auth/manager/log_in/log_in_state.dart';

class Login_view extends StatelessWidget {
  const Login_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('log in Success')));
                Navigator.pushReplacementNamed(context, Routes.HomeScreenBody);
              } else if (state is LoginErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return Form(
                key: cubit.formkey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Welcome\nBack!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 20),
                    CustomTextFormFiled(
                      controller: cubit.passwordController,
                      hintText: 'Password',
                      isObscureText: cubit.isPasswordHidden,
                      prefixIcon: const Icon(Icons.lock_outline),
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
                    const SizedBox(height: 30),
                    CustomBottom(
                      text: 'Login',
                      onPressed: () {
                        cubit.onLoginPressed();
                      },
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.HomeScreenBody);
                      },
                      child: const Text("Don't have an account? Sign Up"),
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

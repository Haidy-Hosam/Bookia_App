import 'package:bookia_app/Features/authentication/data/models/auth_params.dart';
import 'package:bookia_app/Features/authentication/data/repository/auth_repo.dart';
import 'package:bookia_app/Features/authentication/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  Future<void> login() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      email: emailController.text,
      password: passwordController.text,
    );

    var data = await AuthRepo.loginRepo(params);

    if (data != null) {
      log("Login Successful");
      emit(AuthSuccessState());
    } else {
      log("Login Failed");
      emit(AuthErrorState("Something went wrong, Please try again"));
    }
  }

  // =============================================================================== //
  Future<void> register() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
    );

    log('==============6===============');
    log(params.toJson().toString());
    var data = await AuthRepo.registerRepo(params);

    if (data != null) {
      emit(AuthSuccessState());
    } else {
      log("Registration Failed");
      emit(AuthErrorState("Something went wrong, Please try again"));
    }
  }
}

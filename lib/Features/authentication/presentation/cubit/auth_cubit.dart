import 'package:bookia_app/Features/authentication/data/models/auth_params.dart';
import 'package:bookia_app/Features/authentication/data/repository/auth_repo.dart';
import 'package:bookia_app/Features/authentication/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      username: nameController.text,
      email: emailController.text,
    );

    var data = await AuthRepo.loginRepo(params);

    if (data != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState("Something went wrong, Please try again"));
    }
  }

  // =============================================================================== //
  Future<void> register() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      username: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordconfirmation: passwordConfirmationController.text,
    );

    var data = await AuthRepo.registerRepo(params);

    if (data != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState("Something went wrong, Please try again"));
    }
  }
}

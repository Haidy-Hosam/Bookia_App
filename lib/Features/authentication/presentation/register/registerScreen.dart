import 'dart:developer';
import 'package:bookia_app/Core/Common%20Widgets/customtextformdield.dart';
import 'package:bookia_app/Core/Common%20Widgets/dailogs.dart';
import 'package:bookia_app/Core/Common%20Widgets/my_body_view.dart';
import 'package:bookia_app/Core/Common%20Widgets/primary_elevated_button.dart';
import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/routes/navigation.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:bookia_app/Core/Common%20Widgets/apppassformfield.dart';
import 'package:bookia_app/Core/routes/routes.dart';
import 'package:bookia_app/Features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:bookia_app/Features/authentication/presentation/cubit/auth_state.dart';
import 'package:bookia_app/Features/authentication/presentation/login/widget/authfotter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          log("Register Loading");
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          log("Register Success");
          pop(context);
          pushTo(context, Routes.login);
        } else if (state is AuthErrorState) {
          log("Register Failed");
          pop(context);
          showErrorDialog(context, state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 90,
          leading: IconButton(
            onPressed: () {
              pop(context);
            },
            icon: SvgPicture.asset(AppImages.back),
          ),
        ),

        body: _rigesterBody(context),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: AuthFotter(
            first: "Already have an account ?",
            sec: '   Login Now',
            onTap: () {
              pushTo(context, Routes.login);
            },
          ),
        ),
      ),
    );
  }

  Widget _rigesterBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return MyBodyView(
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUnfocus, // ****************** //
          key: cubit.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hello! Register to get started",
                  style: TextStyles.headline,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 30),

              customtextformdield(
                hintText: 'Username',
                keyboardType: TextInputType.emailAddress,
                controller: context.read<AuthCubit>().nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              20.h,
              customtextformdield(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: context.read<AuthCubit>().emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              20.h,
              AppPassFormField(
                title: 'Password',
                controller: context.read<AuthCubit>().passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              10.h,
              AppPassFormField(
                title: 'Confirm password',
                controller: context
                    .read<AuthCubit>()
                    .passwordConfirmationController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  return null;
                },
              ),
              30.h,

              PrimaryElevatedBotton(
                title: 'Register',
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.register();
                  }
                },
              ),
              30.h,
            ],
          ),
        ),
      ),
    );
  }
}

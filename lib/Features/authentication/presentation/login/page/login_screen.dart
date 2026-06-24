import 'dart:developer';

import 'package:bookia_app/Core/Common%20Widgets/customtextformdield.dart';
import 'package:bookia_app/Core/Common%20Widgets/dailogs.dart';
import 'package:bookia_app/Core/Common%20Widgets/my_body_view.dart';
import 'package:bookia_app/Core/Common%20Widgets/primary_elevated_button.dart';
import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/routes/navigation.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:bookia_app/Core/Common%20Widgets/apppassformfield.dart';
import 'package:bookia_app/Core/routes/routes.dart';
import 'package:bookia_app/Features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:bookia_app/Features/authentication/presentation/cubit/auth_state.dart';
import 'package:bookia_app/Features/authentication/presentation/login/widget/authfotter.dart';
import 'package:bookia_app/Features/authentication/presentation/login/widget/gand_a__container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          log("Register Loading");
          pop(context);
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
        body: _loginBody(context),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: AuthFotter(
            first: "Don’t have an Account ?",
            sec: '  Register Now',
            onTap: () {
              pushTo(context, Routes.register);
            },
          ),
        ),
      ),
    );
  }

  MyBodyView _loginBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return MyBodyView(
      child: Form(
        autovalidateMode: AutovalidateMode.onUnfocus, // ****************** //
        key: cubit.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome back! Glad to\n see you, Again!",
                style: TextStyles.headline,
              ),
            ),
            SizedBox(height: 10),

            SizedBox(height: 30),

            customtextformdield(
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              controller: cubit.emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            20.h,
            AppPassFormField(
              title: 'Enter your password',
              Controller: cubit.passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            10.h,
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  pushTo(context, Routes.forgetPassword);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: AppColors.darkGreyColor,
                ),
                child: Text('Forgot Password?'),
              ),
            ),
            30.h,

            PrimaryElevatedBotton(
              title: 'Login',
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.login();
                }
              },
            ),
            30.h,

            Row(
              children: [
                Expanded(child: Divider()),
                40.w,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Or",
                    style: TextStyles.caption2.copyWith(fontSize: 14),
                  ),
                ),
                40.w,
                Expanded(child: Divider()),
              ],
            ),
            30.h,
            GandA_Container(
              title: "Sign in with Google",
              icon: AppImages.google,
            ),
            20.h,
            GandA_Container(title: "Sign in with Apple", icon: AppImages.apple),
          ],
        ),
      ),
    );
  }
}

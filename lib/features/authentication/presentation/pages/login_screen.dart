import 'dart:developer';
import 'package:bookia_app/core/widgets/custom_text_form_field.dart';
import 'package:bookia_app/core/widgets/dialogs.dart';
import 'package:bookia_app/core/widgets/my_body_view.dart';
import 'package:bookia_app/core/widgets/primary_elevated_button.dart';
import 'package:bookia_app/core/constants/app_images.dart';
import 'package:bookia_app/core/utils/extensions.dart';
import 'package:bookia_app/core/routes/navigation.dart';
import 'package:bookia_app/core/styles/app_colors.dart';
import 'package:bookia_app/core/styles/text_styles.dart';
import 'package:bookia_app/core/widgets/app_pass_form_field.dart';
import 'package:bookia_app/core/routes/routes.dart';
import 'package:bookia_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:bookia_app/features/authentication/presentation/cubit/auth_state.dart';
import 'package:bookia_app/features/authentication/presentation/widgets/auth_footer.dart';
import 'package:bookia_app/features/authentication/presentation/widgets/g_and_a_container.dart';
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
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          log("Register Success");
          pop(context);
          pushTobase(context, Routes.mainApp);
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
    final cubit = context.read<AuthCubit>();
    return MyBodyView(
      child: Form(
        autovalidateMode: AutovalidateMode.onUnfocus, // ****************** //
        key: cubit.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome back! Glad to\n see you, Again!",
                  style: TextStyles.headline,
                ),
              ),
              const SizedBox(height: 10),

              const SizedBox(height: 30),

              CustomTextFormField(
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
                controller: cubit.passwordController,
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
                  child: const Text('Forgot Password?'),
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
                  const Expanded(child: Divider()),
                  40.w,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or",
                      style: TextStyles.caption2.copyWith(fontSize: 14),
                    ),
                  ),
                  40.w,
                  const Expanded(child: Divider()),
                ],
              ),
              30.h,
              const GandAContainer(
                title: "Sign in with Google",
                icon: AppImages.google,
              ),
              20.h,
              const GandAContainer(
                title: "Sign in with Apple",
                icon: AppImages.apple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

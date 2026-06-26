import 'package:bookia_app/Core/Common%20Widgets/customtextformdield.dart';
import 'package:bookia_app/Core/Common%20Widgets/my_body_view.dart';
import 'package:bookia_app/Core/Common%20Widgets/primary_elevated_button.dart';
import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/routes/navigation.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:bookia_app/Core/routes/routes.dart';
import 'package:bookia_app/Features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:bookia_app/Features/authentication/presentation/login/widget/authfotter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return Scaffold(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: MyBodyView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                20.h,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Forgot Password?", style: TextStyles.headline),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Don't worry! It occurs. Please enter the email address linked with your account.",
                    style: TextStyles.subtitle.copyWith(
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                ),

                30.h,
                Form(
                  autovalidateMode:
                      AutovalidateMode.onUnfocus, // ****************** //
                  key: cubit.formKey,
                  child: customtextformdield(
                    hintText: 'Enter Your Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: cubit.emailController,
                  ),
                ),
                30.h,

                PrimaryElevatedBotton(
                  title: 'Send Code',
                  onPressed: () {
                    cubit.forgetpassword();
                  },
                ),

                30.h,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: AuthFotter(
          first: "Remember Password ?",
          sec: '   Login',
          onTap: () {
            pushTo(context, Routes.login);
          },
        ),
      ),
    );
  }
}

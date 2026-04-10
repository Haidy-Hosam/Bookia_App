import 'package:bookia_app/Core/Common%20Widgets/customtextformdield.dart';
import 'package:bookia_app/Core/Common%20Widgets/my_body_view.dart';
import 'package:bookia_app/Core/Common%20Widgets/primary_elevated_button.dart';
import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/Functions/navigation.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:bookia_app/Core/Common%20Widgets/apppassformfield.dart';
import 'package:bookia_app/Features/authentication/presentation/login/widget/authfotter.dart';
import 'package:bookia_app/Features/authentication/presentation/login/widget/gand_a__container.dart';
import 'package:bookia_app/Features/authentication/presentation/register/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  controller: TextEditingController(),
                ),
                20.h,
                AppPassFormField(title: 'Enter your password'),
                10.h,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // pushTo(context, ForgotPassword());
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: AppColors.darkGreyColor,
                    ),
                    child: Text('Forgot Password?'),
                  ),
                ),
                30.h,

                PrimaryElevatedBotton(title: 'Login', onPressed: () {}),
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
                GandA_Container(
                  title: "Sign in with Apple",
                  icon: AppImages.apple,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: AuthFotter(
          first: "Don’t have an Account ?",
          sec: '  Register Now',
          onTap: () {
            pushTo(context, RegisterScreen());
          },
        ),
      ),
    );
  }
}

import 'package:bookia_app/Core/Common%20Widgets/customtextformdield.dart';
import 'package:bookia_app/Core/Common%20Widgets/my_body_view.dart';
import 'package:bookia_app/Core/Common%20Widgets/primary_elevated_button.dart';
import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/Functions/navigation.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:bookia_app/Core/Common%20Widgets/apppassformfield.dart';
import 'package:bookia_app/Features/authentication/presentation/login/page/login_screen.dart';
import 'package:bookia_app/Features/authentication/presentation/login/widget/authfotter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    "Hello! Register to get started",
                    style: TextStyles.headline,
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(height: 30),

                customtextformdield(
                  hintText: 'Username',
                  keyboardType: TextInputType.emailAddress,
                  controller: TextEditingController(),
                ),
                20.h,
                customtextformdield(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: TextEditingController(),
                ),
                20.h,
                AppPassFormField(title: 'Password'),
                10.h,
                AppPassFormField(title: 'Confirm password'),
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

                PrimaryElevatedBotton(title: 'Register', onPressed: () {}),
                30.h,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: AuthFotter(
          first: "Already have an account ?",
          sec: '   Login Now',
          onTap: () {
            pushTo(context, LoginScreen());
          },
        ),
      ),
    );
  }
}
import 'package:bookia_app/core/widgets/custom_text_form_field.dart';
import 'package:bookia_app/core/widgets/my_body_view.dart';
import 'package:bookia_app/core/widgets/primary_elevated_button.dart';
import 'package:bookia_app/core/constants/app_images.dart';
import 'package:bookia_app/core/utils/extensions.dart';
import 'package:bookia_app/core/routes/navigation.dart';
import 'package:bookia_app/core/styles/app_colors.dart';
import 'package:bookia_app/core/styles/text_styles.dart';
import 'package:bookia_app/core/routes/routes.dart';
import 'package:bookia_app/features/authentication/presentation/widgets/auth_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                20.h,

                const Align(
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
                CustomTextFormField(
                  hintText: 'Enter Your Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: TextEditingController(),
                ),
                30.h,

                PrimaryElevatedBotton(
                  title: 'Send Code',
                  onPressed: () {
                    pushTo(context, Routes.otpVerification);
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

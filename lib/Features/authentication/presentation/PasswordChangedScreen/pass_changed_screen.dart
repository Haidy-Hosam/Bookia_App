import 'package:bookia_app/Core/Common%20Widgets/my_body_view.dart';
import 'package:bookia_app/Core/Common%20Widgets/primary_elevated_button.dart';
import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/Functions/navigation.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:bookia_app/Features/authentication/presentation/login/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MyBodyView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              40.h,

              SvgPicture.asset(
                AppImages.success,
                width: 100,
                height: 100,
              ),

              30.h,

              Text(
                "Password Changed!",
                style: TextStyles.headline.copyWith(fontSize: 22),
              ),

              10.h,

              Text(
                "Your password has been changed successfully.",
                textAlign: TextAlign.center,
                style: TextStyles.subtitle.copyWith(
                  color: AppColors.greyColor,
                  fontSize: 14,
                ),
              ),

              40.h,

              PrimaryElevatedBotton(
                title: 'Back to Login',
                onPressed: () {
                  pushTo(context, LoginScreen());
                },
              ),

              40.h,
            ],
          ),
        ),
      ),
    );
  }
}
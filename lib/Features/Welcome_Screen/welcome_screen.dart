import 'package:bookia_app/Core/Common%20Widgets/primary_elevated_button.dart';
import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/Functions/navigation.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:bookia_app/Features/authentication/presentation/login/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AppImages.background,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SvgPicture.asset(
                  AppImages.primarylogosvg,
                  width: 216,
                  height: 66,
                ),

                15.h,
                Text(
                  'Order Your Book Now!',
                  style: TextStyles.subtitle.copyWith(
                    fontSize: 18,
                    color: AppColors.darkColor,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 591,
            left: 23,
            right: 23,
            child: Center(
              child: PrimaryElevatedBotton(title: 'Login', onPressed: () {
                pushTo(context, LoginScreen());
              }),
            ),
          ),
          Positioned(
            top: 662,
            left: 23,
            right: 23,
            child: Center(
              child: PrimaryElevatedBotton(
                title: 'Register',
                titleColor: AppColors.darkColor,
                borderColor: AppColors.darkColor,
                backgroundColor: AppColors.backgroundColor,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

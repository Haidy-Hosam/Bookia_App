import 'package:bookia_app/core/widgets/primary_elevated_button.dart';
import 'package:bookia_app/core/constants/app_images.dart';
import 'package:bookia_app/core/utils/extensions.dart';
import 'package:bookia_app/core/routes/navigation.dart';
import 'package:bookia_app/core/styles/app_colors.dart';
import 'package:bookia_app/core/styles/text_styles.dart';
import 'package:bookia_app/core/routes/routes.dart';
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
              child: PrimaryElevatedBotton(
                title: 'Login',
                onPressed: () {
                  pushTo(context, Routes.login);
                },
              ),
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

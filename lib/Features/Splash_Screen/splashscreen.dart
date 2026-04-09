import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.primarylogosvg, width: 216, height: 66),
            10.h,
            Text(
              'Order Your Book Now!',
              style: TextStyles.subtitle.copyWith(
                fontSize: 18,
                color: AppColors.darkGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

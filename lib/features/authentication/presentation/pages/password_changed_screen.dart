import 'package:bookia_app/core/widgets/my_body_view.dart';
import 'package:bookia_app/core/widgets/primary_elevated_button.dart';
import 'package:bookia_app/core/constants/app_images.dart';
import 'package:bookia_app/core/utils/extensions.dart';
import 'package:bookia_app/core/routes/navigation.dart';
import 'package:bookia_app/core/styles/app_colors.dart';
import 'package:bookia_app/core/styles/text_styles.dart';
import 'package:bookia_app/core/routes/routes.dart';
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

              SvgPicture.asset(AppImages.success, width: 100, height: 100),

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
                  pushTo(context, Routes.login);
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

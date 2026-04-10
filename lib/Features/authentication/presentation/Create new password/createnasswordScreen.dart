import 'package:bookia_app/Core/Common%20Widgets/apppassformfield.dart';
import 'package:bookia_app/Core/Common%20Widgets/customtextformdield.dart';
import 'package:bookia_app/Core/Common%20Widgets/my_body_view.dart';
import 'package:bookia_app/Core/Common%20Widgets/primary_elevated_button.dart';
import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/Functions/navigation.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:bookia_app/Features/authentication/presentation/OTP%20Verification/otp_verification.dart';
import 'package:bookia_app/Features/authentication/presentation/PasswordChangedScreen/pass_changed_screen.dart';
import 'package:bookia_app/Features/authentication/presentation/login/page/login_screen.dart';
import 'package:bookia_app/Features/authentication/presentation/login/widget/authfotter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CreatenewpasswordScreeen extends StatelessWidget {
  const CreatenewpasswordScreeen({super.key});

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

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create new password",
                    style: TextStyles.headline,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your new password must be unique from those previously used.",
                    style: TextStyles.subtitle.copyWith(color: AppColors.darkGreyColor),
                  ),
                ),

                30.h,
                
                AppPassFormField(title: 'New Password'),
                                30.h,

                AppPassFormField(title: 'Confirm New Password'),

                30.h,

                PrimaryElevatedBotton(title: 'Reset Password', onPressed: () {
                  pushTo(context, PasswordChangedScreen());
                }),
                30.h,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
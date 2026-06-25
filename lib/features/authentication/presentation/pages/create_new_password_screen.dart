import 'package:bookia_app/core/widgets/app_pass_form_field.dart';
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

                const Align(
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
                    style: TextStyles.subtitle.copyWith(
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                ),

                30.h,

                const AppPassFormField(title: 'New Password'),
                30.h,

                const AppPassFormField(title: 'Confirm New Password'),

                30.h,

                PrimaryElevatedBotton(
                  title: 'Reset Password',
                  onPressed: () {
                    pushTo(context, Routes.passwordChanged);
                  },
                ),
                30.h,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:bookia_app/Core/Common%20Widgets/customtextformdield.dart';
import 'package:bookia_app/Core/Common%20Widgets/my_body_view.dart';
import 'package:bookia_app/Core/Common%20Widgets/primary_elevated_button.dart';
import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/Functions/navigation.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:bookia_app/Features/authentication/presentation/Create%20new%20password/createnasswordScreen.dart';
import 'package:bookia_app/Features/authentication/presentation/login/page/login_screen.dart';
import 'package:bookia_app/Features/authentication/presentation/login/widget/authfotter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class OTP_Verification extends StatefulWidget {
  const OTP_Verification({super.key});

  @override
  State<OTP_Verification> createState() => _OTP_VerificationState();
}

class _OTP_VerificationState extends State<OTP_Verification> {
  int secondsRemaining = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    secondsRemaining = 60;

    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
                  child: Text("OTP Verification", style: TextStyles.headline),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter the verification code we just sent on your email address.",
                    style: TextStyles.subtitle.copyWith(
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                ),

                30.h,

                Pinput(
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 60,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                  ),
                ),

                30.h,

                PrimaryElevatedBotton(title: 'Verify', onPressed: () {
                  pushTo(context, CreatenewpasswordScreeen());
                }),

                20.h,

                secondsRemaining > 0
                    ? Center(
                        child: Text(
                          "Resend code in (0:${secondsRemaining.toString().padLeft(2, '0')})",
                          style: TextStyle(color: AppColors.darkGreyColor),
                        ),
                      )
                    : Center(
                        child: TextButton(
                          onPressed: () {
                            startTimer();
                          },
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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
          first: "Didn’t received code ?",
          sec: '   Resend',
          onTap: () {
            pushTo(context, LoginScreen());
          },
        ),
      ),
    );
  }
}

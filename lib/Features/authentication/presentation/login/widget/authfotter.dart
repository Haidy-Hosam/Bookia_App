import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class AuthFotter extends StatelessWidget {
  const AuthFotter({
    super.key,
    required this.first,
    required this.sec,
    required this.onTap,
  });

  final String first;
  final String sec;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: first,
        style: TextStyles.body.copyWith(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: sec,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w800,
              fontSize: 15,
              // decoration: TextDecoration.underline,
              decorationThickness: 2,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

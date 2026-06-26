import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryElevatedBotton extends StatelessWidget {
  const PrimaryElevatedBotton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.titleColor,
    this.borderColor,

  });

  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(color: borderColor ?? Colors.transparent),
        minimumSize: Size(double.infinity, 50),
      ),

      onPressed: onPressed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.body.copyWith(
          color: titleColor ?? AppColors.backgroundColor,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

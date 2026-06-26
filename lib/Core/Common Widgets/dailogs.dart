import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:lottie/lottie.dart';

void showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.errorColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(message),
    ),
  );
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: AppColors.darkColor.withValues(alpha: 0.7),
    builder: (context) => Center(child: Lottie.asset(AppImages.loadingJson)),
  );
}

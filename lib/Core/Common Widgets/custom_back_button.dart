import 'package:bookia_app/Core/Common%20Widgets/custom_svg_picture.dart';
import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.of(context).pop(),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor, width: 1),
        ),
        padding: const EdgeInsets.all(10),
        child: const CustomSvgPicture(path: AppImages.back),
      ),
    );
  }
}

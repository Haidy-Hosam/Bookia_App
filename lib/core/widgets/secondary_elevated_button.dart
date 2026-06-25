import 'package:bookia_app/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class SecondaryElevatedButton extends StatelessWidget {
  const SecondaryElevatedButton({
    super.key,
    required this.title,
    required this.onpressed,
    this.backgroundColor,
  });

  final String title;
  final VoidCallback onpressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        minimumSize: const Size(30, 50),
      ),

      onPressed: onpressed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.primaryColor),
      ),
    );
  }
}

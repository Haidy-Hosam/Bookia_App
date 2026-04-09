import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:flutter/material.dart';

class SecondaryElevatedButton extends StatelessWidget {
  const SecondaryElevatedButton({super.key, required this.title , required this.onpressed , this.backgroundColor});

  final String title;
  final VoidCallback  onpressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        minimumSize: Size(30, 50),
      ),

      onPressed: onpressed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.primaryColor),
      ),
    );
  }
}

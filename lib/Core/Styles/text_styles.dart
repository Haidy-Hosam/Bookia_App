import 'package:bookia_app/Core/Constants/app_font.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:flutter/material.dart';


class TextStyles {

  static const TextStyle headline = TextStyle(
    fontFamily: AppFonts.dmSerifDisplay,
    fontSize: 30,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle title = TextStyle(
    fontFamily: AppFonts.dmSerifDisplay,
    fontSize: 26,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: AppFonts.dmSerifDisplay,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle body = TextStyle(
    fontFamily: AppFonts.dmSerifDisplay,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
    static const TextStyle caption2 = TextStyle(
    fontSize: 12,
    color: AppColors.greyColor,
  );
}
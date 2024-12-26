import 'package:currency/Core/global/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColor.primary,
  );

  static const textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColor.primary,
  );

  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}

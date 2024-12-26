import 'package:currency/Core/global/theme/app_colors.dart';
import 'package:currency/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData appTheme() => ThemeData(
        scaffoldBackgroundColor: const Color(0xffEFEFEF),
        primaryColor: AppColor.primary,
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: AppColor.primary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColor.primary),
          ),
        ),
        indicatorColor: AppColor.primary,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            foregroundColor: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: AppTextStyles.textStyle16,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors/colors.dart';
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      actionsIconTheme: IconThemeData(color: AppColors.primaryTextColor),
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryTextColor,
        fontFamily: AppColors.fontFamily,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryTextColor,
        fontFamily: AppColors.fontFamily,
      ),
      titleMedium: GoogleFonts.balooThambi2(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppColors.backgroundColor,
      ),
      titleSmall: TextStyle(
        color: AppColors.backgroundColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: AppColors.fontFamily,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      labelStyle: GoogleFonts.balooThambi2(
        color: AppColors.lightGrey,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      hintStyle: GoogleFonts.balooThambi2(
        color: AppColors.lightGrey,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      suffixIconColor: AppColors.lightGrey,
      prefixIconColor: AppColors.lightGrey,
      errorStyle: GoogleFonts.balooThambi2(
        color: AppColors.error,
        fontSize: 12,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.lightGrey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.error),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.lightGrey),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.error),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.greyColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    ),
  );
}

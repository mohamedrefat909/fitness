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
      titleMedium: TextStyle(
        color: Color(0xFF878787),
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: AppColors.fontFamily,
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
        color: AppColors.hintTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      hintStyle:  GoogleFonts.balooThambi2(
        color: AppColors.hintTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      
      suffixIconColor: AppColors.hintTextColor,
      prefixIconColor:AppColors.hintTextColor ,
      errorStyle: GoogleFonts.balooThambi2(
        color: AppColors.error,
        fontSize: 12,
      ),
      
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.filedBorderColor),
      ),

      errorBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.error),
      ), 
      disabledBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.filedBorderColor),
      ) ,
      focusedErrorBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.error),
      ),  
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.filedBorderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.filedBorderColor),
      ),
    ),
  );
}

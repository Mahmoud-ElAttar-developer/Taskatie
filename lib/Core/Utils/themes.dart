import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/Utils/app_colors.dart';
import 'package:flutter_application_3/Core/Utils/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldBgr,
  primaryColor: Colors.black,
  datePickerTheme: DatePickerThemeData(
    backgroundColor: AppColors.scaffoldBgr,
    dayForegroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
  ),
  textTheme: TextTheme(
    displayLarge: getTitleStyle(color: AppColors.blackColor),
    displayMedium: getbodyStyle(color: AppColors.blackColor),
    displaySmall: getSmallStyle(color: AppColors.blackColor),
  ),
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    titleTextStyle: getTitleStyle(),
    iconTheme: IconThemeData(color: AppColors.primaryColor),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.whiteColor),
    trackColor: WidgetStateProperty.all(AppColors.blackColor),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.redColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.redColor),
    ),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.darkScaffoldBgr,
  primaryColor: Colors.white,
  datePickerTheme: DatePickerThemeData(
    backgroundColor: AppColors.darkScaffoldBgr,
    dayForegroundColor: WidgetStateProperty.all(AppColors.whiteColor),
  ),
  textTheme: TextTheme(
    displayLarge: getTitleStyle(color: AppColors.whiteColor),
    displayMedium: getbodyStyle(color: AppColors.whiteColor),
    displaySmall: getSmallStyle(color: AppColors.whiteColor),
  ),
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    titleTextStyle: getTitleStyle(),
    iconTheme: IconThemeData(color: AppColors.whiteColor),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.blackColor),
    trackColor: WidgetStateProperty.all(AppColors.whiteColor),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.redColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.redColor),
    ),
  ),
);

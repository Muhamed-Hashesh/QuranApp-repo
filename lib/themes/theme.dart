import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/themes/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: LightColors.instance.kPrimaryColor,
    onPrimary: LightColors.instance.kPajeColor,
    secondary: LightColors.instance.kSecondaryColor,
    error: Colors.red,
    onError: Colors.white,
    primaryContainer: LightColors.instance.kSecondaryColor,
    onPrimaryContainer: LightColors.instance.kPrimaryColor,
    surface: LightColors.instance.kBackgroundColor,
  ),
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.light().textTheme,
  ).copyWith(
    /// onBoarding only
    titleLarge: GoogleFonts.almarai(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: LightColors.instance.kBlackColor,
    ),

    /// appBar Titles
    titleMedium: GoogleFonts.almarai(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: LightColors.instance.kBlackColor,
    ),

    /// sections up Titles
    titleSmall: GoogleFonts.almarai(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: LightColors.instance.kBlackColor,
    ),
    headlineSmall: GoogleFonts.almarai(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: LightColors.instance.kBlackColor,
    ),

    /// req'a font
    displayLarge: TextStyle(
      fontSize: 32,
      fontFamily: 'AlNile',
      fontWeight: FontWeight.w400,
      color: LightColors.instance.kPrimaryColor,
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontFamily: 'AlNile',
      fontWeight: FontWeight.w400,
      color: LightColors.instance.kPrimaryColor,
    ),
    displaySmall: TextStyle(
      fontSize: 18,
      fontFamily: 'AlNile',
      fontWeight: FontWeight.w400,
      color: LightColors.instance.kPrimaryColor,
    ),
    labelSmall: TextStyle(
      fontSize: 16,
      fontFamily: 'AlNile',
      fontWeight: FontWeight.w400,
      color: LightColors.instance.kPrimaryColor,
    ),
  ),
  scaffoldBackgroundColor: LightColors.instance.kBackgroundColor,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: LightColors.instance.kBackgroundColor,
    foregroundColor: LightColors.instance.kPrimaryColor,
  ),
);

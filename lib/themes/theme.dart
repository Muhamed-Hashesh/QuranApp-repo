import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_project/themes/colors.dart';

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
    onSurface: LightColors.instance.kBlackColor,
    onSecondaryContainer: LightColors.instance.kWhiteColor,
  ),
  textTheme: GoogleFonts.almaraiTextTheme(
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
      color: LightColors.instance.kPrimaryColor,
    ),

    /// sections up Titles
    titleSmall: GoogleFonts.almarai(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: LightColors.instance.kBlackColor,
    ),
    headlineMedium: GoogleFonts.almarai(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: LightColors.instance.kPrimaryColor,
    ),
    headlineSmall: GoogleFonts.almarai(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: LightColors.instance.kPrimaryColor,
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
  cardTheme: CardTheme(
    margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
    color: LightColors.instance.kAyahTodayCardColor,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: DarkColors.instance.kPrimaryColor,
    onPrimary: DarkColors.instance.kPajeColor,
    secondary: DarkColors.instance.kSecondaryColor,
    error: Colors.red,
    onError: Colors.white,
    primaryContainer: DarkColors.instance.kSecondaryColor,
    onPrimaryContainer: DarkColors.instance.kPrimaryColor,
    surface: DarkColors.instance.kBackgroundColor,
    onSurface: DarkColors.instance.kBlackColor,
    onSecondaryContainer: DarkColors.instance.kWhiteColor,
  ),
  textTheme: GoogleFonts.almaraiTextTheme(
    ThemeData.dark().textTheme,
  ).copyWith(
    /// onBoarding only
    titleLarge: GoogleFonts.almarai(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: DarkColors.instance.kBlackColor,
    ),

    /// appBar Titles
    titleMedium: GoogleFonts.almarai(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: DarkColors.instance.kPrimaryColor,
    ),

    /// sections up Titles
    titleSmall: GoogleFonts.almarai(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: DarkColors.instance.kBlackColor,
    ),
    headlineMedium: GoogleFonts.almarai(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: DarkColors.instance.kPrimaryColor,
    ),
    headlineSmall: GoogleFonts.almarai(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: DarkColors.instance.kPrimaryColor,
    ),

    /// req'a font
    displayLarge: TextStyle(
      fontSize: 32,
      fontFamily: 'AlNile',
      fontWeight: FontWeight.w400,
      color: DarkColors.instance.kPrimaryColor,
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontFamily: 'AlNile',
      fontWeight: FontWeight.w400,
      color: DarkColors.instance.kPrimaryColor,
    ),
    displaySmall: TextStyle(
      fontSize: 18,
      fontFamily: 'AlNile',
      fontWeight: FontWeight.w400,
      color: DarkColors.instance.kPrimaryColor,
    ),
    labelSmall: TextStyle(
      fontSize: 16,
      fontFamily: 'AlNile',
      fontWeight: FontWeight.w400,
      color: DarkColors.instance.kPrimaryColor,
    ),
  ),
  scaffoldBackgroundColor: DarkColors.instance.kBackgroundColor,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: DarkColors.instance.kBackgroundColor,
    foregroundColor: DarkColors.instance.kPrimaryColor,
  ),
  cardTheme: CardTheme(
    margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
    color: DarkColors.instance.kAyahTodayCardColor,
  ),
);

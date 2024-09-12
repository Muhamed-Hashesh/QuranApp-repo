import 'package:flutter/material.dart';

class LightColors {
  // ! Singleton
  LightColors._();
  static LightColors instance = LightColors._();

  Color kBackgroundColor = const Color(0xFFFEFBF4);
  Color kPrimaryColor = const Color(0xFF795547);
  Color kSecondaryColor = const Color(0xFFF0E6D2);
  Color kWhiteColor = const Color(0xFFFFFFFF);
  Color kBlackColor = const Color(0xFF000000);
  Color kPajeColor = const Color(0xFFCC9B76);
  Color kAyahTodayFontColor = const Color(0xFFFFE9C2);
  Color kAyahTodayCardColor = const Color(0xFF2C2C2C);
  Color kAyahTodayAudioColor = const Color(0xFF3A3A3A);
}

class DarkColors {
  // ! Singleton
  DarkColors._();
  static DarkColors instance = DarkColors._();

  Color kBackgroundColor = const Color(0xFF141414);
  Color kPrimaryColor = const Color(0xFFFFFFFF);
  Color kSecondaryColor = const Color(0xFF577B9B);
  Color kWhiteColor = const Color(0xFF000000);
  Color kBlackColor = const Color(0xFFFFFFFF);
  Color kPajeColor = const Color(0xFF8EADFF);
  Color kAyahTodayFontColor = const Color(0xFFFFE9C2);
  Color kAyahTodayCardColor = const Color(0xFF2C2C2C);
  Color kAyahTodayAudioColor = const Color(0xFF3A3A3A);
}

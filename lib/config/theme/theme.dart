import 'package:flutter/material.dart';
import 'package:nasa_api/core/color_pellete/app_pellete.dart';

class AppTheme {
  static TextStyle _lightTextStyle(
          {FontWeight? fontWeight, Color? color, double? size}) =>
      TextStyle(
          fontFamily: 'poppins',
          color: color ?? AppPellete.textBlack,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: size ?? 16);

  static final TextTheme _lightTextTheme = TextTheme(
      bodyLarge: _lightTextStyle(),
      bodyMedium: _lightTextStyle(fontWeight: FontWeight.w400, size: 16),
      bodySmall: _lightTextStyle(size: 12),
      titleLarge: _lightTextStyle(
        size: 32,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: _lightTextStyle(size: 24, fontWeight: FontWeight.w600),
      titleSmall: _lightTextStyle(size: 20, fontWeight: FontWeight.w600));

  static final ElevatedButtonThemeData _lightButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: AppPellete.textBlack,
              iconColor: AppPellete.textWhite,
              textStyle: _lightTextStyle()));

  static final BottomNavigationBarThemeData _lightBottomBarTheme =
      BottomNavigationBarThemeData(
    backgroundColor: AppPellete.textWhite,
    selectedLabelStyle: _lightTextStyle(
      size: 12,
    ),
  );

  static dynamic lightTheme = ThemeData.light(useMaterial3: true).copyWith(
      elevatedButtonTheme: _lightButtonTheme,
      textTheme: _lightTextTheme,
      bottomNavigationBarTheme: _lightBottomBarTheme);
}

import 'package:clean_arch_learn/core/colors/app_colors.dart';
import 'package:clean_arch_learn/core/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class AppThemes{
  AppThemes._();

  ///lightMode
  static final ThemeData lightMode = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.white_1,
      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppFonts.mockup12Regular,
        foregroundColor: AppColors.white_1,
        backgroundColor: AppColors.scaffoldColor,
        minimumSize: const Size(130.0, 34.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
     buttonTheme: ButtonThemeData(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
       splashColor: AppColors.secondaryColor,
       buttonColor: AppColors.primaryColor,
       height: 34.0,
       highlightColor: Colors.green,
       textTheme: ButtonTextTheme.normal,
     ),
       textTheme: const TextTheme(
       bodyLarge:TextStyle(
           fontSize: 26.0,
           fontFamily: 'Mockup',
           color: Color(0xff2E2B2A),
           height: 2.0
       ),
       bodyMedium:TextStyle(
         fontSize: 14.0,
         fontFamily: 'Mockup',
         color: Color(0xff2E2B2A),
         height: 1.8,
       ),
       bodySmall:TextStyle(
         fontSize: 10.0,
         fontFamily: 'Mockup',
         color: Color(0xFF7A3FE1),
         height: 1.3,
       ),
     ),
  );

  ///darkMode
  static final ThemeData darkMode = lightMode.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
  );
}
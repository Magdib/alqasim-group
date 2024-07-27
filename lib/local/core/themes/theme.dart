import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/colors.dart';
import 'dark/dark_theme_text.dart';
import 'light/light_theme_text.dart';

class AppTheme {
  ThemeData currentTheme = AppTheme.lightsTheme;
  static ThemeData lightsTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondaryColor,
      primary: AppColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      centerTitle: true,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          displaySmall: displaySmallLight(),
          displayMedium: displayMediumLight(),
          displayLarge: displayLargeLight(),
        ),
    sliderTheme: SliderThemeData(trackHeight: 7
        // .h,
        ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.primaryColor,
      primary: AppColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      centerTitle: true,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    textTheme: TextTheme(
      displaySmall: displaySmallDark(),
      displayMedium: displayMediumDark(),
      displayLarge: displayLargeDark(),
    ),
  );
}

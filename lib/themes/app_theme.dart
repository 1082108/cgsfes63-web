import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData appTheme() => ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.themeColor,
      foregroundColor: AppColors.lightText1,
    ),
    useMaterial3: true,
    fontFamily: "NotoSansJP",
    snackBarTheme: const SnackBarThemeData(showCloseIcon: true),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: AppColors.accentColor),
    dialogTheme: const DialogThemeData(backgroundColor: Colors.white));
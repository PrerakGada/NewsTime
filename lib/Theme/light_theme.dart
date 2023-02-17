import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'typography.dart';

// ignore: non_constant_identifier_names
ThemeData light_theme() => ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: true,
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
      ),
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(),
      primaryTextTheme: textTheme,
      scaffoldBackgroundColor: AppColors.white,
      iconTheme: const IconThemeData(color: AppColors.greyDark),
    );

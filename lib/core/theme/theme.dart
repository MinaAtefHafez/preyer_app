import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayer_app/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData theme() => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white ),
          color: Colors.white,
          centerTitle: false,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryColor ,
            statusBarBrightness: Brightness.dark
          )
        ),
      );
}

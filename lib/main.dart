
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayer_app/app.dart';
import 'package:prayer_app/core/helper/local_helper/local_helper.dart';
import 'package:prayer_app/core/theme/app_colors.dart';
import 'core/configurations/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    EasyLocalization.ensureInitialized(),
    setUpLocators(),
    HiveHelper.init(),
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarBrightness: Brightness.dark));

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/localization',
        child: const PrayerApp()),
  );
}



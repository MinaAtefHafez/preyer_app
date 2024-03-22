import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayer_app/app.dart';
import 'package:prayer_app/core/helper/local_helper/local_helper.dart';
import 'core/dependency_injection/dependency_injection.dart';

//! Hive Adapter 23

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    EasyLocalization.ensureInitialized(),
    setUpLocator(),
    HiveHelper.init(),
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent ,
      statusBarBrightness: Brightness.dark));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/localization',
        child: const PrayerApp()),
  );
}

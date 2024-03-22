import 'package:flutter/material.dart';
import 'package:prayer_app/features/details_app/presentation/pages/choose_language_screen.dart';
import 'package:prayer_app/features/details_app/presentation/pages/choose_method_screen.dart';
import 'package:prayer_app/features/details_app/presentation/pages/gps_screen.dart';
import 'package:prayer_app/features/details_app/presentation/pages/set_location_screen.dart';
import 'package:prayer_app/features/details_app/presentation/pages/set_method_screen.dart';
import 'package:prayer_app/features/details_app/presentation/pages/set_notifications_screen.dart';
import 'package:prayer_app/features/home/presentation/view/screens/home_screen.dart';
import 'package:prayer_app/features/home/presentation/view/screens/prayers_year_screen.dart';
import 'package:prayer_app/features/splash/presentation/pages/splash_screen.dart';

class CustomRouter {
  Route onGenerateRoutes(RouteSettings settings) {
    final widget = switch (settings.name) {
      PrayersYearScreen.name => const PrayersYearScreen() ,
      HomeScreen.name => const HomeScreen(),
      SetNotificationsScreen.name => const SetNotificationsScreen(),
      ChooseMethodScreen.name => const ChooseMethodScreen(),
      SetMethodScreen.name => const SetMethodScreen(),
      SetLocationScreen.name => const SetLocationScreen(),
      ChooseLanguageScreen.name => const ChooseLanguageScreen(),
      GpsScreen.name => const GpsScreen(),
      _ => const SplashScreen()
    };

    return MaterialPageRoute(builder: (_) => widget);
  }
}

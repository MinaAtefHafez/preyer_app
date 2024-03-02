import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/helper/localization/localization_utils.dart';
import 'package:prayer_app/core/routes/navigation.dart';
import 'package:prayer_app/core/routes/routes.dart';
import 'package:prayer_app/core/theme/theme.dart';
import 'package:prayer_app/features/splash/presentation/pages/splash_screen.dart';

class PrayerApp extends StatelessWidget {
  const PrayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (context, child) {
        LocalizationUtils.init(context);
        LocalizationUtils.changeLocale('ar');
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: CustomRouter().onGenerateRoutes,
          home: const SplashScreen(),
          navigatorKey: navigationKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.theme(),
        );
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/configurations/dependency_injection.dart';
import 'package:prayer_app/core/extensions/images_ex.dart';
import 'package:prayer_app/core/helper/local_helper/local_helper.dart';
import 'package:prayer_app/core/routes/navigation.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_cubit.dart';
import 'package:prayer_app/features/details_app/presentation/pages/choose_language_screen.dart';
import 'package:prayer_app/features/home/presentation/view/screens/home_screen.dart';
import '../../../../core/utils/gen/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideTransition;
  final detailsAppCubit = sl<DetailsAppCubit>();
  @override
  void initState() {
    super.initState();
    detailsAppCubit.callLocals();
    initAnimation();
    goTo();
  }

  void goTo() {
    Future.delayed(const Duration(seconds: 8), () {
      if (HiveHelper.isContainesKey(LocalConstants.prayersTypesSettings)) {
        CustomNavigator.instance.pushNamedRemoveUntil(HomeScreen.name);
      } else {
        CustomNavigator.instance
            .pushNamedRemoveUntil(ChooseLanguageScreen.name);
      }
    });
  }

  void initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    _fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
    _slideTransition =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
              opacity: _fadeAnimation,
              child:
                  Assets.imagesSplash.assetImage(width: 350.w, height: 350.h)),
          SlideTransition(
              position: _slideTransition,
              child: Text(tr('Quraan'), style: AppStyles.styleGo30)),
        ],
      )),
    );
  }
}

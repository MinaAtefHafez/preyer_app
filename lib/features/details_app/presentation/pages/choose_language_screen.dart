import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/routes/navigation.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_cubit.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_state.dart';
import 'package:prayer_app/features/details_app/presentation/pages/gps_screen.dart';
import 'package:prayer_app/features/details_app/presentation/widgets/choose_language/choose_language_item.dart';
import 'package:prayer_app/features/details_app/presentation/widgets/details_app_button.dart';
import 'package:restart_app/restart_app.dart';
import '../../../../core/configurations/dependency_injection.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  static const String name = '/ChooseLanguage';

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  final detailsAppCubit = sl<DetailsAppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: detailsAppCubit,
      child: BlocListener<DetailsAppCubit, DetailsAppState>(
        listener: (context, state) {
          if (state is OnLanguageChanged) {
            Restart.restartApp(webOrigin: ChooseLanguageScreen.name);
          }
        },
        child: BlocBuilder<DetailsAppCubit, DetailsAppState>(
            builder: (context, state) => Scaffold(
                  body: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tr('ChooseLanguage'),
                                style: AppStyles.styleGo30,
                              ),
                              40.0.sizedHeight,
                              Column(
                                children: [
                                  // ignore: prefer_const_constructors
                                  ChooseItemLanguage(
                                      value: 0, itemName: 'العربية'),

                                  15.0.sizedHeight,

                                  // ignore: prefer_const_constructors
                                  ChooseItemLanguage(
                                      value: 1, itemName: 'English'),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                              left: 0.0,
                              bottom: 0.0,
                              child: DetailsAppButton(
                                  text: 'Next',
                                  onPressed: () {
                                    CustomNavigator.instance
                                        .pushNamed(GpsScreen.name);
                                  }))
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}

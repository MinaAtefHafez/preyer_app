import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_app/core/dependency_injection/dependency_injection.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/routes/navigation.dart';
import 'package:prayer_app/core/theme/app_colors.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/core/utils/custom_indicator.dart';
import 'package:prayer_app/core/utils/custom_snack_bar.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_cubit.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_state.dart';
import 'package:prayer_app/features/details_app/presentation/pages/set_location_screen.dart';
import 'package:prayer_app/features/details_app/presentation/widgets/prayer_time/prayer_time_type_item.dart';

class GpsScreen extends StatefulWidget {
  const GpsScreen({super.key});

  static const String name = '/prayerTime';

  @override
  State<GpsScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<GpsScreen> {
  final DetailsAppCubit _detailsAppCubit = sl<DetailsAppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _detailsAppCubit,
      child: BlocListener<DetailsAppCubit, DetailsAppState>(
        listener: (context, state) {
          if (state is GetCurrentLocationSuccess) {
            CustomNavigator.instance.pushNamed(SetLocationScreen.name);
          }

          if (state is GetCurrentLocationFailure) {
            showSnckBar(context, text: state.errMessage);
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(tr('PrayerTimes'), style: AppStyles.styleGo30),
                  20.0.sizedHeight,
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(tr('VariableSchedule'),
                          style: AppStyles.styleGo25
                              .copyWith(fontWeight: FontWeight.w400))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(tr('CalculatePrayerTimes'),
                        style: AppStyles.styleGo18
                            .copyWith(color: Colors.grey.shade700)),
                  ),
                  20.0.sizedHeight,
                  BlocBuilder<DetailsAppCubit, DetailsAppState>(
                      builder: (context, state) {
                    if (state is GetCurrentLocationLoading) {
                      return const CustomIndicator(
                          color: AppColors.primaryColor);
                    } else {
                      return InkWell(
                          onTap: () {
                            _detailsAppCubit.getCurrentLocationAndSaveItLocal();
                          },
                          child: const PrayerTimeTypeItem(text: 'GPS'));
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

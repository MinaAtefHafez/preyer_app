import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/dependency_injection/dependency_injection.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/theme/app_colors.dart';
import 'package:prayer_app/core/utils/custom_indicator.dart';
import 'package:prayer_app/core/utils/error_widget.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_cubit.dart';
import 'package:prayer_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:prayer_app/features/home/presentation/cubit/home_state.dart';
import 'package:prayer_app/features/home/presentation/view/widgets/prayers/current_prayer.dart';
import 'package:prayer_app/features/home/presentation/view/widgets/prayers/prayer_location_item.dart';
import 'package:prayer_app/features/home/presentation/view/widgets/prayers/prayers_items.dart';
import 'package:prayer_app/features/home/presentation/view/widgets/prayers/today_item.dart';

class PrayersSceen extends StatefulWidget {
  const PrayersSceen({super.key});

  @override
  State<PrayersSceen> createState() => _PrayersSceenState();
}

class _PrayersSceenState extends State<PrayersSceen> {
  final detailsAppCubit = sl<DetailsAppCubit>();
  final homeCubit = sl<HomeCubit>();

  @override
  void initState() {
    super.initState();
    callApiOrLocalToGetCalendar();
  }

  void callApiOrLocalToGetCalendar() {
    homeCubit.callApiOrLocalToGetCalendar().then((value) {
      Timer.periodic(const Duration(minutes: 1), (timer) {
        homeCubit.getPrayerNowForToday();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeCubit,
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (homeCubit.prayerNow != null) {
            return Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.0.sizedHeight,
                  PrayerLocationItem(
                      userLocationName:
                          detailsAppCubit.userLocationModel!.locationName,
                      onPressed: () {}),
                  30.0.sizedHeight,
                  Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: CurrentPrayerItem(
                        prayerNow: homeCubit.prayerNow!,
                      )),
                  30.0.sizedHeight,
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15.r))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 15),
                              child: TodayItem(
                                  dateToday:
                                      homeCubit.prayerToday!.date!.readable!,
                                  hijri: homeCubit.prayerToday!.date!.hijri!)),
                          Divider(color: Colors.grey.shade500, thickness: 0.5),
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: PrayersItems(
                                    isTimesForToday: homeCubit.isPrayersNowForToday ,
                                      prayerNow: homeCubit.prayerNow!,
                                      times: homeCubit
                                          .prayerToday!.timings!.times))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is GetCalendarEveryMonthFailure) {
            return Center(
                child: CustomErrorWidget(
              errMessage: state.errMessage,
              onTap: () {
                callApiOrLocalToGetCalendar();
              },
            ));
          } else {
            return const Center(
                child: CustomIndicator(color: AppColors.primaryColor));
          }
        },
      ),
    );
  }
}

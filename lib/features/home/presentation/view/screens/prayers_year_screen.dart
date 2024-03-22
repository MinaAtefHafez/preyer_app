import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/dependency_injection/dependency_injection.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/theme/app_colors.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/core/utils/custom_indicator.dart';
import 'package:prayer_app/core/utils/error_widget.dart';
import 'package:prayer_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:prayer_app/features/home/presentation/cubit/home_state.dart';
import 'package:prayer_app/features/home/presentation/view/widgets/prayers_year/prayer_year_top_item.dart';
import 'package:prayer_app/features/home/presentation/view/widgets/prayers_year/prayers_list.dart';

class PrayersYearScreen extends StatefulWidget {
  const PrayersYearScreen({
    super.key,
  });

  static const name = '/prayersYear';

  @override
  State<PrayersYearScreen> createState() => _PrayersYearScreenState();
}

class _PrayersYearScreenState extends State<PrayersYearScreen> {
  final HomeCubit homeCubit = sl<HomeCubit>();

  @override
  void initState() {
    super.initState();
    homeCubit.getCalendarByYear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: homeCubit,
        child: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
          if (homeCubit.calendarYearModel != null &&
              homeCubit.threeMonthsModel != null) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.primaryColor,
                title: Text('كفر الباشا',
                    style: AppStyles.styleGo25.copyWith(color: Colors.white)),
                bottom: PreferredSize(
                  preferredSize: Size(double.infinity, 200.h),
                  child: Column(children: [
                    PrayerYearTopItem(
                      onTap: () {},
                      left: () {},
                      right: () {},
                      threeMonthsModel: homeCubit.threeMonthsModel!,
                    ),
                    30.0.sizedHeight,
                    PrayersList(
                        calendarYearModel: homeCubit.calendarYearModel!),
                    10.0.sizedHeight,
                  ]),
                ),
              ),
            );
          } else if (state is GetCalendarEveryYearFailure) {
            return Container(
              color: Colors.white,
              child: CustomErrorWidget(
                  errMessage: state.errMessage,
                  onTap: () {
                    homeCubit.getCalendarByYear();
                  }),
            );
          } else {
            return Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: const CustomIndicator());
          }
        }));
  }
}

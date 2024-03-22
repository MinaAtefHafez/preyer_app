import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/features/home/data/models/calendar_year_model/calendar_year_model.dart';

class PrayersList extends StatelessWidget {
  const PrayersList({super.key, required this.calendarYearModel});

  final CalendarYearModel calendarYearModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 50.w),
        ...calendarYearModel.data!['1']![0].timings!.fivePrayers
            .map((e) => Expanded(
                  child: Center(
                    child: Text(
                      tr(e.prayerName),
                      style: AppStyles.styleGo18.copyWith(color: Colors.white),
                    ),
                  ),
                ))
            .toList()
      ],
    );
  }
}

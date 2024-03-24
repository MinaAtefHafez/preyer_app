import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/features/home/data/models/calendar_year_model/calendar_year_model.dart';

import 'prayers_list_item.dart';

class PrayersList extends StatelessWidget {
  const PrayersList({super.key, required this.calendarYearModel});

  final CalendarYearModel calendarYearModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 50.w),
        const PrayersListItem(prayerName: 'Fajr'),
        const PrayersListItem(prayerName: 'Dhuhr'),
        const PrayersListItem(prayerName: 'Asr'),
        const PrayersListItem(prayerName: 'Maghrib'),
        const PrayersListItem(prayerName: 'Isha'),
      ],
    );
  }
}



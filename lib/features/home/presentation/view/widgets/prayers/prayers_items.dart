import 'package:flutter/material.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/features/home/data/models/prayer_model_now/prayer_model_now.dart';
import 'package:prayer_app/features/home/presentation/view/widgets/prayers/prayers_item.dart';

class PrayersItems extends StatelessWidget {
  const PrayersItems(
      {super.key,
      required this.times,
      required this.prayerNow,
      required this.isTimesForToday});

  final List<PrayerModelNow> times;
  final PrayerModelNow prayerNow;
  final bool isTimesForToday;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return PrayersItem(
            index: index,
            isPrayerNow: isTimesForToday
                ? prayerNow.prayerName == times[index].prayerName
                : false,
            prayer: times[index],
          );
        },
        separatorBuilder: (context, index) => 10.0.sizedHeight,
        itemCount: times.length);
  }
}

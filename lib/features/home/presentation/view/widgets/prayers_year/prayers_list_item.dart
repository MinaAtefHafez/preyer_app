


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prayer_app/core/theme/app_styles.dart';

class PrayersListItem extends StatelessWidget {
  const PrayersListItem({super.key, required this.prayerName});

  final String prayerName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          tr(prayerName),
          style: AppStyles.styleGo18.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/theme/app_styles.dart';

class PrayerTimeTypeItem extends StatelessWidget {
  const PrayerTimeTypeItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(color: Colors.grey.shade300, width: 2.w),
      ),
      child: Text(text, style: AppStyles.styleGo20),
    );
  }
}

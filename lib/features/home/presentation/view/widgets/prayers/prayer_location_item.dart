import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/theme/app_styles.dart';

class PrayerLocationItem extends StatelessWidget {
  const PrayerLocationItem(
      {super.key, required this.userLocationName, required this.onPressed});

  final String userLocationName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, right: 20.w),
        child: Row(
          children: [
            IconButton(
                onPressed: onPressed ,
                icon: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 30.w,
                )),
            const Spacer(),
            Text(
              userLocationName,
              style: AppStyles.styleGo20
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/theme/app_styles.dart';

void showSnckBar(BuildContext context, {required String text, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: color ?? Colors.grey.shade400,
    content: Text(text, style: AppStyles.styleGo18),
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
    ),
  ));
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/theme/app_colors.dart';
import 'package:prayer_app/core/theme/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errMessage;
  final Function() onTap;

  const CustomErrorWidget(
      {super.key, required this.errMessage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            height: 250.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.red,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(tr('Error'), style: AppStyles.styleGo25),
                Text(errMessage, style: AppStyles.styleGo18),
              ],
            ),
          ),
          30.0.sizedHeight ,
          MaterialButton(
              onPressed: onTap,
              color: AppColors.primaryColor,
              elevation: 0 ,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r) ,
              borderSide: BorderSide.none
              ),
              child: Text(tr('Reload'),
                  style: AppStyles.styleGo18.copyWith(color: Colors.white)))
        ],
      ),
    );
  }
}

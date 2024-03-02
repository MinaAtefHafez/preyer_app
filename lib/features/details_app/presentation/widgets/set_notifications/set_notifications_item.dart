import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/core/utils/custom_switch.dart';

class SetNotificationsItem extends StatelessWidget {
  const SetNotificationsItem(
      {super.key,
      required this.text,
      required this.value,
      required this.onChanged});

  final String text;
  final bool value;
  final Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w , right: 20.w),
      height: 70.h,
      width: 350.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.r),
          border: Border.all(color: Colors.grey.shade300, width: 2.w)),
      child: Row(
        children: [
          Text(tr(text),
              style: AppStyles.styleGo20.copyWith(fontWeight: FontWeight.w500)),
          const Spacer(),
          CustomSwitch(value: value, onChanged: onChanged) ,
        ],
      ),
    );
  }
}

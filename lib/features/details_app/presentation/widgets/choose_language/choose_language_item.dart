import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/dependency_injection/dependency_injection.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/theme/app_colors.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_cubit.dart';

class ChooseItemLanguage extends StatefulWidget {
  const ChooseItemLanguage(
      {super.key, required this.value, required this.itemName});

  final int value;
  final String itemName;

  @override
  State<ChooseItemLanguage> createState() => _ChooseItemLanguageState();
}

class _ChooseItemLanguageState extends State<ChooseItemLanguage> {
  final detailsAppCubit = sl<DetailsAppCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          border: Border.all(color: Colors.grey.shade300, width: 2.w)),
      height: 60.h,
      child: Row(
        children: [
          Radio(
              value: widget.value,
              activeColor: AppColors.primaryColor,
              groupValue: detailsAppCubit.languageRadio,
              onChanged: (value) {
                detailsAppCubit.onLanguageChanged(value!);
              }),
          30.0.sizedWidth,
          Text(widget.itemName, style: AppStyles.styleGo20)
        ],
      ),
    );
  }
}

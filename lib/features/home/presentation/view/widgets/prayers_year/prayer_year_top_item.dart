import 'package:flutter/material.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/features/home/data/models/tow_months_model/three_months_model.dart';

class PrayerYearTopItem extends StatelessWidget {
  const PrayerYearTopItem(
      {super.key,
      required this.right,
      required this.left,
      required this.threeMonthsModel,
      required,
      required this.onTap});

  final Function() right;
  final Function() left;
  final Function() onTap;
  final ThreeMonthsModel threeMonthsModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: left,
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        Expanded(
            child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                      '${threeMonthsModel.firstMonth} ${threeMonthsModel.firstYear}',
                      style: AppStyles.styleGo20.copyWith(color: Colors.white)),
                  10.0.sizedHeight,
                  Text(
                      '${threeMonthsModel.secondMonth} - ${threeMonthsModel.thirdMonth} ${threeMonthsModel.secondYear}',
                      style: AppStyles.styleGo18.copyWith(color: Colors.white))
                ],
              ),
              10.0.sizedWidth,
              const Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
        )),
        IconButton(
            onPressed: right,
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white)),
      ],
    );
  }
}

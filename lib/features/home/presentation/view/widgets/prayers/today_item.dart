import 'package:flutter/material.dart';
import 'package:prayer_app/core/dependency_injection/dependency_injection.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/routes/navigation.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/core/utils/date_picker.dart';
import 'dart:ui' as ui;
import 'package:prayer_app/features/home/data/models/calendar_model/calendar_model/calendar_model.dart';
import 'package:prayer_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:prayer_app/features/home/presentation/view/screens/prayers_year_screen.dart';

class TodayItem extends StatefulWidget {
  const TodayItem({
    super.key,
    required this.dateToday,
    required this.hijri,
  });

  final String dateToday;
  final Hijri hijri;

  @override
  State<TodayItem> createState() => _TodayItemState();
}

class _TodayItemState extends State<TodayItem> {
  final HomeCubit homeCubit = sl<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: _chooseDate,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: Text(widget.dateToday,
                        style: AppStyles.styleGo18
                            .copyWith(fontWeight: FontWeight.w600)),
                  ),
                  10.0.sizedWidth,
                  const Icon(Icons.keyboard_arrow_down_sharp,
                      size: 30, color: Colors.deepOrange)
                ],
              ),
              Directionality(
                textDirection: ui.TextDirection.ltr,
                child: Text(
                    '${widget.hijri.day} ${widget.hijri.month!.en} ${widget.hijri.year}',
                    style: AppStyles.style15.copyWith(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              CustomNavigator.instance.pushNamed(PrayersYearScreen.name);
            },
            icon: const Icon(Icons.date_range)),
      ],
    );
  }

  void _chooseDate() async {
    final dateTimeResult = await customDatePicker(
      context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day),
    );

    if (dateTimeResult == null) return;
    await homeCubit.getPrayersTodayFromCaledarMonthModel(date: dateTimeResult);
  }
}

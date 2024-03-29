import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/theme/app_colors.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/features/home/data/models/prayer_model_now/prayer_model_now.dart';

class PrayersItem extends StatefulWidget {
  const PrayersItem(
      {super.key,
      required this.isPrayerNow,
      required this.prayer,
      required this.index});

  final bool isPrayerNow;
  final PrayerModelNow prayer;

  final int index;

  @override
  State<PrayersItem> createState() => _PrayersItemState();
}

class _PrayersItemState extends State<PrayersItem>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500 * widget.index));
    _animation =
        Tween<Offset>(begin: const Offset(5, 0), end: const Offset(0, 0))
            .animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PrayersItem oldWidget) {
    _animationController.reset();
    _animationController.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: widget.isPrayerNow
                    ? Border.all(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        width: 2)
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    decoration: widget.isPrayerNow
                        ? BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20.r))
                        : null,
                    child: Text(tr(widget.prayer.prayerName),
                        style: AppStyles.styleGo20.copyWith(
                            color: widget.isPrayerNow
                                ? AppColors.primaryColor
                                : Colors.grey.shade700)),
                  ),
                  const Spacer(),
                  Text(widget.prayer.prayerDate.split(' ').first,
                      style: AppStyles.styleGo18.copyWith(
                          color: widget.isPrayerNow
                              ? AppColors.primaryColor
                              : Colors.grey.shade700,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          30.0.sizedWidth,
          Icon(
            widget.isPrayerNow ? Icons.mic : Icons.mic_off,
          )
        ],
      ),
    );
  }
}

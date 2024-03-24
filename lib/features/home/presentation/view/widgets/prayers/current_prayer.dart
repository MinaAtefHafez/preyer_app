import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/features/home/data/models/prayer_model_now/prayer_model_now.dart';

class CurrentPrayerItem extends StatefulWidget {
  const CurrentPrayerItem({
    super.key,
    required this.prayerNow,
  });

  final PrayerModelNow prayerNow;

  @override
  State<CurrentPrayerItem> createState() => _CurrentPrayerItemState();
}

class _CurrentPrayerItemState extends State<CurrentPrayerItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  bool isReverse = false;

  @override
  void initState() {
    super.initState();
    animate();
  }

  void animate() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        if (isReverse) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      }
      isReverse = !isReverse;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    10.0.sizedWidth,
                    if (widget.prayerNow.prayerDate.isNotEmpty) ...[
                      FadeTransition(
                        opacity: _animation,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(40.r)),
                          child: Text(tr(widget.prayerNow.prayerName),
                              style: AppStyles.styleGo25
                                  .copyWith(color: Colors.white)),
                        ),
                      ),
                    ] else ...[
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(40.r)),
                          child: FittedBox(
                            child: Text(tr(widget.prayerNow.prayerName),
                                style: AppStyles.styleGo25
                                    .copyWith(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                10.0.sizedHeight,
                if (widget.prayerNow.prayerDate.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text(widget.prayerNow.prayerDate.split(' ').first,
                        style:
                            AppStyles.styleGo25.copyWith(color: Colors.white)),
                  ),
                ]
              ],
            ),
          ),
          15.0.sizedWidth,
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 150.h, maxWidth: 150.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: CachedNetworkImage(
                imageUrl:
                    'https://img.freepik.com/premium-vector/muslim-woman-reading-quran-sitting-ramadan-kareem-vector-flat-islam-activities_199064-538.jpg?w=740',
                errorWidget: (context, url, error) => const SizedBox(),
                placeholder: (context, url) => Container(
                  width: 150.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.grey.shade300.withOpacity(0.5)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

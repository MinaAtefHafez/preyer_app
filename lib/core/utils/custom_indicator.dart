import 'package:flutter/material.dart';
import 'package:prayer_app/core/theme/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? AppColors.primaryColor,
    );
  }
}

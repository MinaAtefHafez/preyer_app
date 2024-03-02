import 'package:flutter/material.dart';
import 'package:prayer_app/core/theme/app_colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, required this.value, required this.onChanged});

  final bool value;
  final Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: Colors.white,
        inactiveThumbColor: Colors.white,
        activeTrackColor: AppColors.primaryColor,
        inactiveTrackColor: Colors.grey.shade300,
        value: value,
        onChanged: onChanged);
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prayer_app/core/theme/app_styles.dart';

class SureLocationTextField extends StatelessWidget {
  const SureLocationTextField(
      {super.key,
      required this.value,
      required this.label,
      this.onTap,
      this.maxLines});

  final String value;
  final String label;
  final Function()? onTap;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLines: maxLines ?? 1,
      initialValue: value,
      readOnly: true,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.grey.shade900)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.grey.shade900)),
          labelText: tr(label),
          labelStyle:
              AppStyles.styleGo18.copyWith(color: Colors.grey.shade600)),
    );
  }
}

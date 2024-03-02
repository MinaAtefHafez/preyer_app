import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prayer_app/core/theme/app_styles.dart';

class DetailsAppButton extends StatelessWidget {
  const DetailsAppButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(tr(text), style: AppStyles.styleGo25));
  }
}

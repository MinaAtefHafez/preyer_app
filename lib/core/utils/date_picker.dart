import 'package:flutter/material.dart';

Future<DateTime?> customDatePicker(
  BuildContext context, {
  required DateTime firstDate,
  required DateTime lastDate,
}) {
  return showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDatePickerMode: DatePickerMode.day);
}

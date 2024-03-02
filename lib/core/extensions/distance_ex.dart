import 'package:flutter/material.dart';

extension Distance on double {
  SizedBox get sizedWidth => SizedBox(width: this);
  SizedBox get sizedHeight => SizedBox(height: this);
}

import 'package:flutter/material.dart';

extension ImagesEx on String {
  Image assetImage(
          {BoxFit fit = BoxFit.contain,
          double width = 0.0,
          double height = 0.0}) =>
      Image.asset(this, fit: fit, width: width, height: height);

  ImageProvider assetsImageProvider() => AssetImage(this);
}

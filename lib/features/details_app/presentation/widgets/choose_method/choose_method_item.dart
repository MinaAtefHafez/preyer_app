import 'package:flutter/material.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/features/details_app/data/models/methods_model/methods_model.dart';

class ChooseMethodItem extends StatelessWidget {
  const ChooseMethodItem({super.key, required this.methodsTypeModel});

  final MethodsTypeModel methodsTypeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(methodsTypeModel.name!,
              style: AppStyles.styleGo18.copyWith(fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'fajr: ${methodsTypeModel.params!.fajr}:0 , isha: ${methodsTypeModel.params!.isha}:0',
            style: AppStyles.style15.copyWith(color: Colors.grey.shade600),
          ),
        ),
        Divider(color: Colors.grey.shade700, thickness: 0.3),
      ],
    );
  }
}

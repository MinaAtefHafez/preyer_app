import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_app/core/configurations/dependency_injection.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/routes/navigation.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_cubit.dart';
import 'package:prayer_app/features/details_app/presentation/pages/set_method_screen.dart';
import 'package:prayer_app/features/details_app/presentation/widgets/details_app_button.dart';
import 'package:prayer_app/features/details_app/presentation/widgets/sure_location/sure_location_text_field.dart';

class SetLocationScreen extends StatefulWidget {
  const SetLocationScreen({super.key});

  static const name = '/SetLocation';

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  final DetailsAppCubit _detailsAppCubit = sl<DetailsAppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _detailsAppCubit,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tr('SureOfYourLocation'),
                style: AppStyles.styleGo30,
                textAlign: TextAlign.center,
              ),
              30.0.sizedHeight,
              const SureLocationTextField(
                  value: 'بركة النصر', label: 'LocationName'),
              15.0.sizedHeight,
              SureLocationTextField(
                  value: _detailsAppCubit.currentLocation!.latitude.toString(),
                  label: 'Latitude'),
              15.0.sizedHeight,
              SureLocationTextField(
                  value: _detailsAppCubit.currentLocation!.longitude.toString(),
                  label: 'Longitude'),
              40.0.sizedHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailsAppButton(
                      text: 'Back',
                      onPressed: () {
                        CustomNavigator.instance.pop();
                      }),
                  DetailsAppButton(
                      text: 'Next',
                      onPressed: () {
                        CustomNavigator.instance
                            .pushNamed(SetMethodScreen.name);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_app/core/configurations/dependency_injection.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/routes/navigation.dart';
import 'package:prayer_app/core/theme/app_colors.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/core/utils/custom_indicator.dart';
import 'package:prayer_app/core/utils/custom_snack_bar.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_cubit.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_state.dart';
import 'package:prayer_app/features/details_app/presentation/pages/choose_method_screen.dart';
import 'package:prayer_app/features/details_app/presentation/pages/set_notifications_screen.dart';
import 'package:prayer_app/features/details_app/presentation/widgets/details_app_button.dart';
import 'package:prayer_app/features/details_app/presentation/widgets/sure_location/sure_location_text_field.dart';

class SetMethodScreen extends StatefulWidget {
  const SetMethodScreen({super.key});

  static const name = '/setMethod';

  @override
  State<SetMethodScreen> createState() => _SetMethodScreenState();
}

class _SetMethodScreenState extends State<SetMethodScreen> {
  final detailsAppCubit = sl<DetailsAppCubit>();

  @override
  void initState() {
    super.initState();
    detailsAppCubit.getMethods();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: detailsAppCubit,
      child: BlocListener<DetailsAppCubit, DetailsAppState>(
        listener: (context, state) {
          if (state is SaveMethodChoosenSuccess) {
            CustomNavigator.instance.pushNamed(SetNotificationsScreen.name);
          }

          if (state is SaveMethodChoosenFailure) {
            showSnckBar(context, text: state.errMessage);
          }
        },
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: BlocBuilder<DetailsAppCubit, DetailsAppState>(
                builder: (context, state) {
                  if (state is GetMethodsFailure) {
                    return Text(state.errMessage, style: AppStyles.styleGo20);
                  } else if (state is GetMethodsLoading) {
                    return const CustomIndicator(color: AppColors.primaryColor);
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(tr('SetCalculationMethod'),
                            style: AppStyles.styleGo25
                                .copyWith(color: AppColors.primaryColor)),
                        40.0.sizedHeight,
                        BlocBuilder<DetailsAppCubit, DetailsAppState>(
                          builder: (context, state) {
                            return SureLocationTextField(
                                maxLines: 2,
                                onTap: () {
                                  CustomNavigator.instance.pushNamedReplacement(
                                      ChooseMethodScreen.name);
                                },
                                value: detailsAppCubit.methodsTypeModel.name!,
                                label: tr('CalculationMethod'));
                          },
                        ),
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
                                  detailsAppCubit.saveMethodChoosen();
                                }),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

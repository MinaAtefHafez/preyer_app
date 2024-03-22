import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_app/core/dependency_injection/dependency_injection.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/routes/navigation.dart';
import 'package:prayer_app/core/theme/app_colors.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/core/utils/custom_indicator.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_cubit.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_state.dart';
import 'package:prayer_app/features/details_app/presentation/pages/set_method_screen.dart';
import 'package:prayer_app/features/details_app/presentation/widgets/choose_method/choose_method_item.dart';

class ChooseMethodScreen extends StatefulWidget {
  const ChooseMethodScreen({super.key});

  static const name = '/chooseMethod';

  @override
  State<ChooseMethodScreen> createState() => _ChooseMethodScreenState();
}

class _ChooseMethodScreenState extends State<ChooseMethodScreen> {
  final DetailsAppCubit detailsAppCubit = sl<DetailsAppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: detailsAppCubit,
      child: BlocListener<DetailsAppCubit, DetailsAppState>(
        listener: (context, state) {
          if (state is ChooseMethod) {
            CustomNavigator.instance.pushNamedReplacement(SetMethodScreen.name);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text(tr('CalculationMethod'),
                style: AppStyles.styleGo20.copyWith(color: Colors.white)),
            titleSpacing: 0,
          ),
          body: BlocBuilder<DetailsAppCubit, DetailsAppState>(
            builder: (context, state) {
              if (detailsAppCubit.methodsModel != null) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final methodModel = detailsAppCubit.methodsModel!.data
                            .allMethods()[index];
                        return InkWell(
                            onTap: () {
                              final methodId = methodModel.id;
                              detailsAppCubit.chooseMethod(methodId!);
                            },
                            child: ChooseMethodItem(
                                methodsTypeModel: methodModel));
                      },
                      separatorBuilder: (context, index) => 10.0.sizedHeight,
                      itemCount: detailsAppCubit.methodsModel!.data
                          .allMethods()
                          .length),
                );
              } else {
                return const Center(
                    child: CustomIndicator(color: AppColors.primaryColor));
              }
            },
          ),
        ),
      ),
    );
  }
}

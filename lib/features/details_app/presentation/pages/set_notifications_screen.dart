import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_app/core/dependency_injection/dependency_injection.dart';
import 'package:prayer_app/core/extensions/distance_ex.dart';
import 'package:prayer_app/core/routes/navigation.dart';
import 'package:prayer_app/core/theme/app_styles.dart';
import 'package:prayer_app/core/utils/custom_snack_bar.dart';
import 'package:prayer_app/features/details_app/data/models/prayer_type_model/prayer_type_model.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_cubit.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_state.dart';
import 'package:prayer_app/features/details_app/presentation/widgets/details_app_button.dart';
import 'package:prayer_app/features/details_app/presentation/widgets/set_notifications/set_notifications_item.dart';
import 'package:prayer_app/features/home/presentation/view/screens/home_screen.dart';

class SetNotificationsScreen extends StatefulWidget {
  const SetNotificationsScreen({super.key});

  static const name = '/setNotifications';

  @override
  State<SetNotificationsScreen> createState() => _SetNotificationsScreenState();
}

class _SetNotificationsScreenState extends State<SetNotificationsScreen> {
  final detailsAppCubit = sl<DetailsAppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: detailsAppCubit,
      child: BlocListener<DetailsAppCubit, DetailsAppState>(
        listener: (context, state) {
          if (state is SavePrayersTypesSettingsSuccess) {
            CustomNavigator.instance.pushNamedRemoveUntil(HomeScreen.name);
          }

          if (state is SavePrayersTypesSettingsFailure) {
            showSnckBar(context, text: state.errMessage);
          }
        },
        child: Scaffold(body: Center(
          child: BlocBuilder<DetailsAppCubit, DetailsAppState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w , vertical: 70.h ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(tr('ActiveNotifications'), style: AppStyles.styleGo25),
                    10.0.sizedHeight,
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            final PrayerTypeModel model =
                                detailsAppCubit.convertPrayersMap[index];
                            return SetNotificationsItem(
                                text: model.prayerName!,
                                value: model.isActiveNotification!,
                                onChanged: (value) {
                                  detailsAppCubit
                                      .prayerTypeEditNotificationSetting(
                                          prayerName: model.prayerName!,
                                          notif: value);
                                });
                          },
                          separatorBuilder: (context, index) =>
                              15.0.sizedHeight,
                          itemCount: detailsAppCubit.convertPrayersMap.length),
                    ),
                    Row(
                      children: [
                        DetailsAppButton(
                            text: 'Back',
                            onPressed: () {
                              CustomNavigator.instance.pop();
                            }),
                        const Spacer(),
                        DetailsAppButton(
                            text: 'Next',
                            onPressed: () {
                              detailsAppCubit.savePrayersTypesSettings();
                            }),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        )),
      ),
    );
  }
}

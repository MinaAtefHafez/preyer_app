import 'package:prayer_app/features/details_app/data/models/methods_model/methods_model.dart';
import 'package:prayer_app/features/details_app/data/models/user_location_model.dart';

abstract class DetailsAppState {}

class DetailsAppInitial extends DetailsAppState {}

class OnLanguageChanged extends DetailsAppState {}

//! Get Location

class GetCurrentLocationLoading extends DetailsAppState {}

class GetCurrentLocationSuccess extends DetailsAppState {}

class GetCurrentLocationFailure extends DetailsAppState {
  final String errMessage;

  GetCurrentLocationFailure(this.errMessage);
}

class GetUserLocationLocalSuccess extends DetailsAppState {
  final UserLocationModel userLocationModel;

  GetUserLocationLocalSuccess(this.userLocationModel);
}

class GetUserLocationFailure extends DetailsAppState {
  final String errMessage;

  GetUserLocationFailure(this.errMessage);
}

//! Get Methods

class GetMethodsLoading extends DetailsAppState {}

class GetMethodsFailure extends DetailsAppState {
  final String errMessage;

  GetMethodsFailure(this.errMessage);
}

class GetMethodsSuccess extends DetailsAppState {}

class GetMethodsLocalSuccess extends DetailsAppState {
  final MethodsModel methodsModel;

  GetMethodsLocalSuccess(this.methodsModel);
}

class GetMethodsLocalFailure extends DetailsAppState {
  final String errMessaage;

  GetMethodsLocalFailure(this.errMessaage);
}

class ChooseMethod extends DetailsAppState {}

class SaveAllMethodsLocalLoading extends DetailsAppState {}

class SaveAllMethodsLocalSuccess extends DetailsAppState {}

class SaveAllMethodsLocalFailure extends DetailsAppState {
  final String errMessage;

  SaveAllMethodsLocalFailure(this.errMessage);
}

class SaveMethodChoosenSuccess extends DetailsAppState {}

class SaveMethodChoosenFailure extends DetailsAppState {
  final String errMessage;

  SaveMethodChoosenFailure(this.errMessage);
}

class GetMethodChoosenLocalSuccess extends DetailsAppState {
  final MethodsTypeModel methodsTypeModel;

  GetMethodChoosenLocalSuccess(this.methodsTypeModel);
}

class GetMethodChoosenLocalFailure extends DetailsAppState {
  final String errMessage;

  GetMethodChoosenLocalFailure(this.errMessage);
}

//! Settings

class PrayerTypeNotificationSetting extends DetailsAppState {}

class SavePrayersTypesSettingsSuccess extends DetailsAppState {}

class SavePrayersTypesSettingsFailure extends DetailsAppState {
  final String errMessage;

  SavePrayersTypesSettingsFailure(this.errMessage);
}

class GetPrayerTypeSettingsLocalSuccess extends DetailsAppState {
  final Map<dynamic, dynamic> prayersSettings;

  GetPrayerTypeSettingsLocalSuccess(this.prayersSettings);
}

class GetPrayerTypeSettingsLocalFailure extends DetailsAppState {
  final String errMessage;

  GetPrayerTypeSettingsLocalFailure(this.errMessage);
}

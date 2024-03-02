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

class GetUserLocationLocalSuccess extends DetailsAppState {}

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

class GetMethodsLocalSuccess extends DetailsAppState {}

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

class GetMethodChoosenLocalSuccess extends DetailsAppState {}

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

class GetPrayerTypeSettingsLocalSuccess extends DetailsAppState {}

class GetPrayerTypeSettingsLocalFailure extends DetailsAppState {
  final String errMessage;

  GetPrayerTypeSettingsLocalFailure(this.errMessage);
}

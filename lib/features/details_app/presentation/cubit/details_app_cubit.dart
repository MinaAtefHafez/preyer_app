import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayer_app/core/helper/local_helper/local_helper.dart';
import 'package:prayer_app/core/helper/localization/localization_utils.dart';
import 'package:prayer_app/core/helper/location/location_helper.dart';
import 'package:prayer_app/core/helper/permission/permission_helper.dart';
import 'package:prayer_app/features/details_app/data/models/methods_model/methods_model.dart';
import 'package:prayer_app/features/details_app/data/models/prayer_type_model/prayer_type_model.dart';
import 'package:prayer_app/features/details_app/data/models/user_location_model.dart';
import 'package:prayer_app/features/details_app/data/repositories/details_app_repo_impl.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_state.dart';

class DetailsAppCubit extends Cubit<DetailsAppState> {
  DetailsAppCubit(
      this._locationHelper, this._permissionHelper, this._detailsAppRepo)
      : super(DetailsAppInitial());

  int languageRadio = LocalizationUtils.isArabic ? 0 : 1;

  final DetailsAppRepo _detailsAppRepo;
  final LocationHelper _locationHelper;
  final PermissionHelper _permissionHelper;
  Position? currentLocation;
  UserLocationModel? userLocationModel;
  MethodsModel? methodsModel;
  MethodsTypeModel methodsTypeModel = MethodsTypeModel.initial();

  List prayersTypes = [
    PrayerTypeModel(prayerName: 'Fajr'),
    PrayerTypeModel(prayerName: 'Dhuhr'),
    PrayerTypeModel(prayerName: 'Asr'),
    PrayerTypeModel(prayerName: 'Maghrib'),
    PrayerTypeModel(prayerName: 'Isha')
  ];

  void onLanguageChanged(int value) async {
    languageRadio = value;
    value == 1
        ? await LocalizationUtils.changeLocale('en')
        : await LocalizationUtils.changeLocale('ar');
    emit(OnLanguageChanged());
  }

  Future<void> getCurrentLocationAndSaveItLocal() async {
    final checkPermission = await _permissionHelper.checkLocationPermission();
    if (!checkPermission) return;
    emit(GetCurrentLocationLoading());
    currentLocation = await _locationHelper.getCurrentPosition();
    final UserLocationModel userLocation =
        UserLocationModel.fromPosition(currentLocation!);
    final result = await _detailsAppRepo.putUserLocationData(userLocation);
    result.fold(() {
      emit(GetCurrentLocationSuccess());
    }, (failure) {
      emit(GetCurrentLocationFailure(failure.message));
    });
  }

  Future<void> getUserLocationLocal() async {
    final result = await _detailsAppRepo.getUserLocationLocal();
    result.fold((failure) {
      emit(GetUserLocationFailure(failure.message));
    }, (userLocation) {
      userLocationModel = userLocation;
      emit(GetUserLocationLocalSuccess());
    });
  }

  //! Methods

  Future<void> getMethods() async {
    emit(GetMethodsLoading());
    final result = await _detailsAppRepo.getMethods();
    result.fold((failure) {
      emit(GetMethodsFailure(failure.message));
    }, (model) {
      methodsModel = model;
      emit(GetMethodsSuccess());
    });
  }

  Future<void> getMethodsLocal() async {
    final result = await _detailsAppRepo.getMethods();
    result.fold((failure) {
      emit(GetMethodsLocalFailure(failure.message));
    }, (model) {
      methodsModel = model;
      emit(GetMethodsLocalSuccess());
    });
  }

  Future<void> chooseMethod([int methodId = 5]) async {
    for (var element in methodsModel!.data.allMethods()) {
      if (element.id == methodId) {
        methodsTypeModel = element;
      }
    }
    emit(ChooseMethod());
  }

  Future<void> saveAllMethodsLocal() async {
    emit(SaveAllMethodsLocalLoading());
    final result = await _detailsAppRepo.saveAllMethods(methodsModel!);
    result.fold(() {
      emit(SaveAllMethodsLocalSuccess());
    }, (failure) {
      emit(SaveAllMethodsLocalFailure(failure.message));
    });
  }

  Future<void> saveMethodChoosen() async {
    final result = await _detailsAppRepo.saveMethodChoosen(methodsTypeModel);
    result.fold(() {
      emit(SaveMethodChoosenSuccess());
    }, (failure) {
      emit(SaveMethodChoosenFailure(failure.message));
    });
  }

  Future<void> getMethodChoosenLocal() async {
    final result = await _detailsAppRepo.getMethodChoosen();
    result.fold((failure) {
      emit(GetMethodChoosenLocalFailure(failure.message));
    }, (model) {
      methodsTypeModel = model;
      emit(GetMethodChoosenLocalSuccess());
    });
  }

  //! Settings

  void prayerTypeEditNotificationSetting(
      {required int index, required bool notif}) {
    prayersTypes[index].copyWith(isActiveNotification: notif);
    emit(PrayerTypeNotificationSetting());
  }

  Future<void> savePrayersTypesSettings() async {
    final result = await _detailsAppRepo.savePrayersTypesSettings(prayersTypes);
    result.fold(() {
      emit(SavePrayersTypesSettingsSuccess());
    }, (failure) {
      emit(SavePrayersTypesSettingsFailure(failure.message));
    });
  }

  Future<void> getPrayersTypesSettingsLocal() async {
    final result = await _detailsAppRepo.getPrayersTypesSettings();
    result.fold((failure) {
      emit(GetPrayerTypeSettingsLocalFailure(failure.message));
    }, (prayerModel) {
      prayersTypes = prayerModel;
      emit(GetPrayerTypeSettingsLocalSuccess());
    });
  }

  //! other

  Future<void> callLocals() async {
    if (HiveHelper.isContainesKey(LocalConstants.userLocation)) {
      getUserLocationLocal();
    }

    if (HiveHelper.isContainesKey(LocalConstants.allMethods)) {
      getMethods();
    }

    if (HiveHelper.isContainesKey(LocalConstants.methodChoosen)) {
      getMethodChoosenLocal();
    }

    if (HiveHelper.isContainesKey(LocalConstants.prayersTypesSettings)) {
      getPrayersTypesSettingsLocal();
    }
  }

 @override
  void onChange(Change<DetailsAppState> change) {
    super.onChange(change);
  }
}





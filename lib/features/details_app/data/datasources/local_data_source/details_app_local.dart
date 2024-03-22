import 'package:hive_flutter/adapters.dart';
import 'package:prayer_app/core/exceptions/exceptions.dart';
import 'package:prayer_app/core/helper/local_helper/local_helper.dart';
import 'package:prayer_app/features/details_app/data/models/methods_model/methods_model.dart';
import 'package:prayer_app/features/details_app/data/models/user_location_model.dart';

abstract class DetailsAppLocalDataSource {
  Future<void> putUserLocationData(
      {required UserLocationModel userLocationModel});

  Future<UserLocationModel> getUserLocationLocal();
  Future<void> saveAllMethods({required MethodsModel methodsModel});

  Future<void> saveMethodChoosen({required MethodsTypeModel methodsTypeModel});

  Future<MethodsTypeModel> getMethodChoosen();

  Future<MethodsModel> getAllMethods();

  Future<void> savePrayerTypesSettings(
      {required Map<dynamic, dynamic> prayersSettingsList});
  Future<Map<dynamic, dynamic>> getPrayerTypesSettings();
}

class DetailsAppLocalDataSourceImpl implements DetailsAppLocalDataSource {
  @override
  Future<void> putUserLocationData(
      {required UserLocationModel userLocationModel}) async {
    try {
      await HiveHelper.putData<UserLocationModel>(
          key: LocalConstants.userLocation, value: userLocationModel);
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }

  @override
  Future<void> saveAllMethods({required MethodsModel methodsModel}) async {
    try {
      await HiveHelper.putData<MethodsModel>(
          key: LocalConstants.allMethods, value: methodsModel);
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }

  @override
  Future<void> savePrayerTypesSettings(
      {required Map<dynamic, dynamic> prayersSettingsList}) async {
    try {
      await HiveHelper.putData<Map<dynamic, dynamic>>(
          key: LocalConstants.prayersTypesSettings, value: prayersSettingsList);
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }

  @override
  Future<MethodsModel> getAllMethods() async {
    try {
      final allMethods =
          await HiveHelper.getData(key: LocalConstants.allMethods);
      return allMethods;
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }

  @override
  Future<void> saveMethodChoosen(
      {required MethodsTypeModel methodsTypeModel}) async {
    try {
      await HiveHelper.putData<MethodsTypeModel>(
          key: LocalConstants.methodChoosen, value: methodsTypeModel);
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }

  @override
  Future<UserLocationModel> getUserLocationLocal() async {
    try {
      final data = await HiveHelper.getData(key: LocalConstants.userLocation);
      return data;
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }

  @override
  Future<Map<dynamic, dynamic>> getPrayerTypesSettings() async {
    try {
      final data =
          await HiveHelper.getData(key: LocalConstants.prayersTypesSettings);
      return data;
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }

  @override
  Future<MethodsTypeModel> getMethodChoosen() async {
    try {
      final data = await HiveHelper.getData(key: LocalConstants.methodChoosen);
      return data;
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }
}

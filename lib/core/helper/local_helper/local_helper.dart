import 'package:hive_flutter/hive_flutter.dart';
import 'package:prayer_app/features/details_app/data/models/methods_model/methods_model.dart';
import 'package:prayer_app/features/details_app/data/models/prayer_type_model/prayer_type_model.dart';
import 'package:prayer_app/features/details_app/data/models/user_location_model.dart';

abstract class HiveHelper {
  static late final Box box;

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserLocationModelAdapter());
    Hive.registerAdapter(MethodsModelAdapter());
    Hive.registerAdapter(MethodsDataModelAdapter());
    Hive.registerAdapter(MethodsTypeModelAdapter());
    Hive.registerAdapter(MethodsParamsModelAdapter());
    Hive.registerAdapter(MethodsLocationModelAdapter());
    Hive.registerAdapter(MethodsCustomModelAdapter());
    Hive.registerAdapter(PrayerTypeModelAdapter());
    box = await Hive.openBox(LocalConstants.box);
  }

  static bool isContainesKey(String key) {
    return box.containsKey(key);
  }

  static Future<void> putData<T>(
      {required String key, required T value}) async {
    await box.put(key, value);
  }

  static Future <dynamic> getData({required String key}) async {
    return box.get(key);
  }
}

abstract class LocalConstants {
  static const String box = 'data';
  static const String userLocation = 'userLocation';
  static const String allMethods = 'allMethods';
  static const String methodChoosen = 'methodChoosen';
  static const String prayersTypesSettings = 'prayersTypeSettings';
}

import 'package:dartz/dartz.dart';
import 'package:prayer_app/core/exceptions/exceptions.dart';
import 'package:prayer_app/core/exceptions/failures.dart';
import 'package:prayer_app/features/details_app/data/datasources/local_data_source/details_app_local.dart';
import 'package:prayer_app/features/details_app/data/datasources/remote_data_source/details_app_remote_data_source.dart';
import 'package:prayer_app/features/details_app/data/models/methods_model/methods_model.dart';
import 'package:prayer_app/features/details_app/data/models/user_location_model.dart';

abstract class DetailsAppRepo {
  late UserLocationModel userLocationModel;
  late MethodsModel methodsModel;
  late MethodsTypeModel methodsTypeModel;
  late List prayersTypesSettings;

  Future<Option<Failure>> putUserLocationData(
      UserLocationModel userLocationModel);

  Future<Either<Failure, UserLocationModel>> getUserLocationLocal();

  Future<Either<Failure, MethodsModel>> getMethods();

  Future<Option<Failure>> saveAllMethods(MethodsModel methodsModel);

  Future<Option<Failure>> saveMethodChoosen(MethodsTypeModel methodsTypeModel);

  Future<Either<Failure, MethodsTypeModel>> getMethodChoosen();

  Future<Either<Failure, MethodsModel>> getAllMethodsLocal();

  Future<Option<Failure>> savePrayersTypesSettings(List prayersTypes);
  Future<Either<Failure, List>> getPrayersTypesSettings();
}

class DetailsAppRepoImpl extends DetailsAppRepo {
  final DetailsAppLocalDataSource _detailsAppLocalDataSource;
  final DetailsAppRemoteDataSource _detailsAppRemoteDataSource;

  DetailsAppRepoImpl(
      this._detailsAppLocalDataSource, this._detailsAppRemoteDataSource);

  @override
  Future<Option<Failure>> putUserLocationData(
      UserLocationModel userLocationModel) async {
    try {
      _detailsAppLocalDataSource.putUserLocationData(
          userLocationModel: userLocationModel);
      return none();
    } on LocalException catch (e) {
      return some(LocalFailure(e.errMesssage));
    }
  }

  @override
  Future<Either<Failure, MethodsModel>> getMethods() async {
    try {
      final data = await _detailsAppRemoteDataSource.getMethods();
      return right(MethodsModel.fromJson(data));
    } on ServerException catch (e) {
      return left(ServerFailure(e.errMessage));
    }
  }

  @override
  Future<Option<Failure>> saveAllMethods(MethodsModel methodsModel) async {
    try {
      await _detailsAppLocalDataSource.saveAllMethods(
          methodsModel: methodsModel);
      return none();
    } on LocalException catch (e) {
      return some(LocalFailure(e.errMesssage));
    }
  }

  @override
  Future<Option<Failure>> savePrayersTypesSettings(List prayersTypes) async {
    try {
      await _detailsAppLocalDataSource.savePrayerTypesSettings(
          prayersSettingsList: prayersTypes);
      return none();
    } on LocalException catch (e) {
      return some(LocalFailure(e.errMesssage));
    }
  }

  @override
  Future<Either<Failure, MethodsModel>> getAllMethodsLocal() async {
    try {
      final result = await _detailsAppLocalDataSource.getAllMethods();
      methodsModel = result;
      return right(result);
    } on LocalException catch (e) {
      return left(LocalFailure(e.errMesssage));
    }
  }

  @override
  Future<Option<Failure>> saveMethodChoosen(
      MethodsTypeModel methodsTypeModel) async {
    try {
      await _detailsAppLocalDataSource.saveMethodChoosen(
          methodsTypeModel: methodsTypeModel);
      return none();
    } on LocalException catch (e) {
      return some(LocalFailure(e.errMesssage));
    }
  }

  @override
  Future<Either<Failure, UserLocationModel>> getUserLocationLocal() async {
    try {
      final result = await _detailsAppLocalDataSource.getUserLocationLocal();
      userLocationModel = result;
      return right(result);
    } on LocalException catch (e) {
      return left(LocalFailure(e.errMesssage));
    }
  }

  @override
  Future<Either<Failure, List>> getPrayersTypesSettings() async {
    try {
      final result = await _detailsAppLocalDataSource.getPrayerTypesSettings();
      prayersTypesSettings = result;
      return right(result);
    } on LocalException catch (e) {
      return left(LocalFailure(e.errMesssage));
    }
  }

  @override
  Future<Either<Failure, MethodsTypeModel>> getMethodChoosen() async {
    try {
      final result = await _detailsAppLocalDataSource.getMethodChoosen();
      methodsTypeModel = result;
      return right(result);
    } on LocalException catch (e) {
      return left(LocalFailure(e.errMesssage));
    }
  }
}

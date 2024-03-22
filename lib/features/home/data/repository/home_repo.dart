import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:prayer_app/core/exceptions/exceptions.dart';
import 'package:prayer_app/core/exceptions/failures.dart';
import 'package:prayer_app/core/helper/methods_helper/methods_helper.dart';
import 'package:prayer_app/features/home/data/data_source/local_data_source/home_local_data_source.dart';
import 'package:prayer_app/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:prayer_app/features/home/data/models/calendar_model/calendar_model/calendar_model.dart';
import 'package:prayer_app/features/home/data/models/calendar_year_model/calendar_year_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, CalendarModel>> getCalendar(
      {required Map<String, dynamic> queryParam});
  Future<Option<Failure>> saveCalendarMonthLocal(CalendarModel calendarModel);

  Future<Either<Failure, dynamic>> getCalendarMonthLocal();

  Future<Option<Failure>> saveMonthLocal();
  Future<Either<Failure, String>> getMonthLocal();

  Future<Either<Failure, CalendarYearModel>> getCalendarYear(
      {required Map<String, dynamic> queryParam, String? year});

  Future<Option<Failure>> saveCalendarYearLocal(
      CalendarYearModel calendarYearModel);
  Future<Either<Failure, dynamic>> getCalendarYearLocal();
}

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;

  HomeRepoImpl(this._homeRemoteDataSource, this._homeLocalDataSource);

  @override
  Future<Either<Failure, CalendarModel>> getCalendar({
    required Map<String, dynamic> queryParam,
  }) async {
    try {
      final date = MethodsHelper.getYearAndMoth();
      final month = date.split('/').first;
      final year = date.split('/').last;
      final data = await _homeRemoteDataSource.getCalender(
          queryParam: queryParam, month: month, year: year);
      return right(CalendarModel.fromJson(data));
    } on ServerException catch (e) {
      return left(ServerFailure(e.errMessage));
    }
  }

  @override
  Future<Option<Failure>> saveCalendarMonthLocal(
      CalendarModel calendarModel) async {
    try {
      await _homeLocalDataSource.saveCaledarMonthLocal(calendarModel);
      return none();
    } on LocalException catch (e) {
      return some(LocalFailure(e.errMesssage));
    }
  }

  @override
  Future<Either<Failure, dynamic>> getCalendarMonthLocal() async {
    try {
      final data = await _homeLocalDataSource.getCalendarMonthLocal();
      return right(data);
    } on LocalException catch (e) {
      return left(LocalFailure(e.errMesssage));
    }
  }

  @override
  Future<Option<Failure>> saveMonthLocal() async {
    try {
      final month = DateFormat.M().format(DateTime.now());
      await _homeLocalDataSource.saveMonthLocal(month);
      return none();
    } on LocalException catch (e) {
      return some(LocalFailure(e.errMesssage));
    }
  }

  @override
  Future<Either<Failure, String>> getMonthLocal() async {
    try {
      final data = await _homeLocalDataSource.getMonthNowLocal();
      return right(data);
    } on LocalException catch (e) {
      return left(LocalFailure(e.errMesssage));
    }
  }

  @override
  Future<Either<Failure, CalendarYearModel>> getCalendarYear(
      {required Map<String, dynamic> queryParam,
      String? year,
      String? month}) async {
    try {
      year = year ?? DateTime.now().year.toString();
      final data = await _homeRemoteDataSource.getCalenderYear(
          queryParam: queryParam, year: year);
      return right(CalendarYearModel.fromJson(data));
    } on ServerException catch (e) {
      return left(ServerFailure(e.errMessage));
    }
  }

  @override
  Future<Option<Failure>> saveCalendarYearLocal(
      CalendarYearModel calendarYearModel) async {
    try {
      await _homeLocalDataSource.saveCalendarYearLocal(calendarYearModel);
      return none();
    } on LocalException catch (e) {
      return some(LocalFailure(e.errMesssage));
    }
  }

  @override
  Future<Either<Failure, dynamic>> getCalendarYearLocal() async {
    try {
      final data = await _homeLocalDataSource.getCalendarYearLocal();
      return right(data);
    } on LocalException catch (e) {
      return left(LocalFailure(e.errMesssage));
    }
  }
}

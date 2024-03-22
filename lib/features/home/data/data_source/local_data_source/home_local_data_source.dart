import 'package:hive_flutter/adapters.dart';
import 'package:prayer_app/core/exceptions/exceptions.dart';
import 'package:prayer_app/core/helper/local_helper/local_helper.dart';
import 'package:prayer_app/features/home/data/models/calendar_model/calendar_model/calendar_model.dart';
import 'package:prayer_app/features/home/data/models/calendar_year_model/calendar_year_model.dart';

abstract class HomeLocalDataSource {
  Future<void> saveCaledarMonthLocal(CalendarModel calendarModel);
  Future<dynamic> getCalendarMonthLocal();
  Future<String> getMonthNowLocal();
  Future<void> saveMonthLocal(String month);
  Future<void> saveCalendarYearLocal(CalendarYearModel calendarYearModel);
  Future<dynamic> getCalendarYearLocal();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  Future<void> saveCaledarMonthLocal(CalendarModel calendarModel) async {
    try {
      await HiveHelper.putData<CalendarModel>(
          key: LocalConstants.calendarMonth, value: calendarModel);
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }

  @override
  Future<dynamic> getCalendarMonthLocal() async {
    try {
      final data = await HiveHelper.getData(key: LocalConstants.calendarMonth);
      return data;
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }

  @override
  Future<void> saveMonthLocal(String month) async {
    try {
      await HiveHelper.putData<String>(
          key: LocalConstants.monthNow, value: month);
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }

  @override
  Future<String> getMonthNowLocal() async {
    try {
      final data = await HiveHelper.getData(key: LocalConstants.monthNow);
      return data;
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }

  @override
  Future<void> saveCalendarYearLocal(
      CalendarYearModel calendarYearModel) async {
    try {
      await HiveHelper.putData<CalendarYearModel>(
          key: LocalConstants.calendarYear, value: calendarYearModel);
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }

  @override
  Future getCalendarYearLocal() async {
    try {
      final data = await HiveHelper.getData(key: LocalConstants.calendarYear);
      return data;
    } on HiveError catch (e) {
      throw LocalException(e.message);
    }
  }
}

import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_app/core/helper/methods_helper/methods_helper.dart';
import 'package:prayer_app/features/details_app/data/repositories/details_app_repo_impl.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_cubit.dart';
import 'package:prayer_app/features/home/data/models/calendar_model/calendar_model/calendar_model.dart';
import 'package:prayer_app/features/home/data/models/calendar_year_model/calendar_year_model.dart';
import 'package:prayer_app/features/home/data/models/prayer_model_now/prayer_model_now.dart';
import 'package:prayer_app/features/home/data/models/tow_months_model/three_months_model.dart';
import 'package:prayer_app/features/home/data/repository/home_repo.dart';
import 'package:prayer_app/features/home/presentation/cubit/home_state.dart';
import 'package:prayer_app/features/home/presentation/view/screens/dome_screen.dart';
import 'package:prayer_app/features/home/presentation/view/screens/hijri_screen.dart';
import 'package:prayer_app/features/home/presentation/view/screens/prayers_screen.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this._homeRepo, this._detailsAppRepo, this.detailsAppCubit)
      : super(HomeInitial());

  final HomeRepo _homeRepo;
  final DetailsAppRepo _detailsAppRepo;
  final DetailsAppCubit detailsAppCubit;

  CalendarModel? calendarModel;

  Datum? prayerToday;
  String? monthNow;
  PrayerModelNow? prayerNow;

  //! Calendar Year

  CalendarYearModel? calendarYearModel;
  List<Datum> prayersForMonth = [];
  ThreeMonthsModel? threeMonthsModel;

  int bottomNavBarIndex = 0;
  final List<Widget> activeScreen = [
    const PrayersSceen(),
    const DomeScreen(),
    const HijriScreen(),
  ];

  void changeBottomNavIndex(int index) {
    bottomNavBarIndex = index;
    emit(BottomNavIndex());
  }

  //! calendar By month

  Future<void> getCalendarByMonth() async {
    emit(GetCalendarEveryMonthLoading());
    final Map<String, dynamic> queryParam = {
      'latitude': _detailsAppRepo.userLocationModel.latitude,
      'longitude': _detailsAppRepo.userLocationModel.longitude,
      'method': _detailsAppRepo.methodsTypeModel.id
    };

    final result = await _homeRepo.getCalendar(queryParam: queryParam);
    result.fold((failure) {
      emit(GetCalendarEveryMonthFailure(failure.message));
    }, (model) async {
      calendarModel = model;
      await saveCalendarByMonth();
      await saveMonthLocal();
      await getCalendarMonthLocal();
    });
  }

  Future<void> saveCalendarByMonth() async {
    final result = await _homeRepo.saveCalendarMonthLocal(calendarModel!);
    result.fold(() {
      emit(SaveCalendarMonthLocalSuccess());
    }, (failure) {
      emit(SaveCalendarMonthLocalFailure(failure.message));
    });
  }

  Future<void> getCalendarMonthLocal() async {
    final result = await _homeRepo.getCalendarMonthLocal();
    result.fold((failure) {
      emit(GetCalendarEveryMonthFailure(failure.message));
    }, (model) async {
      calendarModel = model;
      await getMonthLocal();
      await getPrayersTodayFromCaledarMonthModel();
      getPrayerNowForToday();
      emit(GetCalendarMonthLocalSuccess());
    });
  }

  Future<void> getPrayersTodayFromCaledarMonthModel({DateTime? date}) async {
    final timeNow = MethodsHelper.getDayNow(date);
    prayerToday = calendarModel!.data!
        .singleWhere((element) => element.date!.gregorian!.day == timeNow);
    emit(GetPrayersToday());
  }

  Future<PrayerModelNow> getPrayerNow(List<PrayerModelNow> prayers) async {
    final timeNow = MethodsHelper.parseTimeIn24();
    PrayerModelNow prayerNow = PrayerModelNow(prayerName: 'NothingPrayersNow');
    for (int index = 0; index < prayers.length; index++) {
      final prayerNowAsString = prayers[index].prayerDate.split(' ').first;
      final prayerNowDateTime = MethodsHelper.parseTimeIn24(prayerNowAsString);
      if (index == 0 && timeNow.isBefore(prayerNowDateTime)) {
        prayerNow = prayers[index];
        break;
      }
      if (index < prayers.length - 1) {
        final prayerNextAsString =
            prayers[index + 1].prayerDate.split(' ').first;
        final prayerNextDateTime =
            MethodsHelper.parseTimeIn24(prayerNextAsString);
        if (timeNow.isAfter(prayerNowDateTime) &&
            timeNow.isBefore(prayerNextDateTime)) {
          prayerNow = prayers[index];
          break;
        }
      }

      final minutseDiffernece = timeNow.difference(prayerNowDateTime).inMinutes;
      if (index == prayers.length - 1 && minutseDiffernece <= 30) {
        prayerNow = prayers[index];
        break;
      }
    }
    return prayerNow;
  }

  Future<void> getPrayerNowForToday() async {
    prayerNow = await getPrayerNow(prayerToday!.timings!.times);
    emit(GetPrayerNow());
  }

  bool get isPrayersNowForToday {
    final today = MethodsHelper.getDayNow();
    return prayerToday!.date!.gregorian!.day == today;
  }

  Future<void> saveMonthLocal() async {
    final result = await _homeRepo.saveMonthLocal();
    result.fold(() {}, (failure) {});
  }

  Future<void> getMonthLocal() async {
    final result = await _homeRepo.getMonthLocal();
    result.fold((failure) {}, (month) {
      monthNow = month;
    });
  }

  Future<void> callApiOrLocalToGetCalendar() async {
    final month = MethodsHelper.getMonthNow();
    if (month != monthNow) {
      getCalendarByMonth();
    } else {
      getCalendarMonthLocal();
    }
  }

  //! Calendar By Year

  Future<void> getCalendarByYear() async {
    emit(GetCalendarEveryYearLoading());
    final Map<String, dynamic> queryParam = {
      'latitude': _detailsAppRepo.userLocationModel.latitude,
      'longitude': _detailsAppRepo.userLocationModel.longitude,
      'method': _detailsAppRepo.methodsTypeModel.id
    };
    final result = await _homeRepo.getCalendarYear(queryParam: queryParam);
    result.fold((failure) {
      emit(GetCalendarEveryYearFailure(failure.message));
    }, (model) async {
      calendarYearModel = model;
      await saveCalendarYearLocal();
      await getCalendarYearLocal();
      await getPrayersForMonthFromCalendarYearModel();
      await getOneGeorgianAndTowMonthsHijriFromCalendarYearModel();
      emit(GetCalendarEveryYearSuccess());
    });
  }

  Future<void> saveCalendarYearLocal() async {
    final result = await _homeRepo.saveCalendarYearLocal(calendarYearModel!);
    result.fold(() {
      emit(SaveCalendarEveryYearLocalSuccess());
    }, (failure) {
      emit(SaveCalendarEveryYearLocalFailure(failure.message));
    });
  }

  Future<void> getCalendarYearLocal() async {
    final result = await _homeRepo.getCalendarYearLocal();
    result.fold((failure) {
      emit(GetCalendarEveryYearLocalFailure(failure.message));
    }, (model) {
      emit(GetCalendarEveryYearLocalSuccess());
    });
  }

  Future<void> getPrayersForMonthFromCalendarYearModel([String? month]) async {
    prayersForMonth = calendarYearModel!.data![month ?? monthNow]!;
    emit(GetPrayersForMonthFromCalendarYearModel());
  }

  Future<void> getOneGeorgianAndTowMonthsHijriFromCalendarYearModel() async {
    for (int index = 0; index < prayersForMonth.length; index++) {
      if (index < prayersForMonth.length - 1) {
        threeMonthsModel = ThreeMonthsModel(
            firstMonth: prayersForMonth[index].date!.gregorian!.month!.en,
            thirdMonth: prayersForMonth[index + 1].date!.hijri!.month!.en,
            secondMonth: prayersForMonth[index].date!.hijri!.month!.en,
            firstYear: prayersForMonth[index].date!.gregorian!.year,
            secondYear: prayersForMonth[index].date!.hijri!.year);
      }
      if (threeMonthsModel!.whenSecondMonthNotEqualThirdMonth) break;
    }
    emit(GetOneGeorgianAndTowMonthsHijriFromCalendarYearModel());
  }
}

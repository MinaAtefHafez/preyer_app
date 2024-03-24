abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class BottomNavIndex extends HomeStates {}

//! Get Calendar

class GetCalendarEveryMonthLoading extends HomeStates {}

class GetCalendarEveryMonthFailure extends HomeStates {
  final String errMessage;

  GetCalendarEveryMonthFailure(this.errMessage);
}

//! save calendar local

class SaveCalendarMonthLocalSuccess extends HomeStates {}

class SaveCalendarMonthLocalFailure extends HomeStates {
  final String errMessage;

  SaveCalendarMonthLocalFailure(this.errMessage);
}

//! Get calendar Local

class GetCalendarMonthLocalSuccess extends HomeStates {}

class GetCalendarMonthLocalFailure extends HomeStates {
  final String errMessage;

  GetCalendarMonthLocalFailure(this.errMessage);
}

//! Get Prayer Now

class GetPrayersToday extends HomeStates {}

class GetPrayerNow extends HomeStates {}

//! search for prayers day

class SearchForPrayersDay extends HomeStates {}

//! Get Calendar By Year

class GetCalendarEveryYearLoading extends HomeStates {}

class GetCalendarEveryYearSuccess extends HomeStates {}

class GetCalendarEveryYearFailure extends HomeStates {
  final String errMessage;

  GetCalendarEveryYearFailure(this.errMessage);
}

class SaveCalendarEveryYearLocalSuccess extends HomeStates {}

class SaveCalendarEveryYearLocalFailure extends HomeStates {
  final String errMessage;

  SaveCalendarEveryYearLocalFailure(this.errMessage);
}

class GetCalendarEveryYearLocalSuccess extends HomeStates {}

class GetCalendarEveryYearLocalFailure extends HomeStates {
  final String errMessage;

  GetCalendarEveryYearLocalFailure(this.errMessage);
}

class GetPrayersForMonthFromCalendarYearModel extends HomeStates {}

class GetOneGeorgianAndTowMonthsHijriFromCalendarYearModel extends HomeStates {}

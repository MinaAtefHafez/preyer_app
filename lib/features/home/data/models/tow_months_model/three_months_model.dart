class ThreeMonthsModel {
  String? firstMonth;
  String? secondMonth;
  String? thirdMonth;
  String? firstYear;
  String? secondYear;

  ThreeMonthsModel(
      {this.firstMonth,
      this.secondMonth,
      this.thirdMonth,
      this.firstYear,
      this.secondYear});

  ThreeMonthsModel copyWith(
      {String? firstMonth,
      String? secondMonth,
      String? thirdMonth,
      String? firstYear,
      String? secondYear}) {
    return ThreeMonthsModel(
      firstMonth: firstMonth ?? this.firstMonth,
      secondMonth: secondMonth ?? this.secondMonth,
      thirdMonth: thirdMonth ?? this.thirdMonth,
      firstYear: firstYear ?? this.firstYear,
      secondYear: secondYear ?? this.secondYear,
    );
  }

  bool get whenSecondMonthNotEqualThirdMonth {
    return secondMonth != thirdMonth;
  }
}

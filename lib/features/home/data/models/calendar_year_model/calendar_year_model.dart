import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:prayer_app/features/home/data/models/calendar_model/calendar_model/calendar_model.dart';

part 'calendar_year_model.g.dart';

@HiveType(typeId: 23)
@JsonSerializable(createToJson: false)
class CalendarYearModel {
  CalendarYearModel({
    required this.code,
    required this.status,
    required this.data,
  });
  @HiveField(0)
  final int? code;
  @HiveField(1)
  final String? status;
  @HiveField(2)
  final Map<String, List<Datum>>? data;

  factory CalendarYearModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarYearModelFromJson(json);
}


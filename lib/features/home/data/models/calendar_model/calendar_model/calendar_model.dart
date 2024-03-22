import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prayer_app/features/home/data/models/prayer_model_now/prayer_model_now.dart';
part 'calendar_model.g.dart';

@HiveType(typeId: 8)
class CalendarModel {
  @HiveField(0)
  int? code;
  @HiveField(1)
  String? status;
  @HiveField(2)
  List<Datum>? data;

  CalendarModel({this.code, this.status, this.data});

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
        code: json['code'] as int?,
        status: json['status'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

@HiveType(typeId: 9)
class Date {
  @HiveField(0)
  String? readable;
  @HiveField(1)
  String? timestamp;
  @HiveField(2)
  Gregorian? gregorian;
  @HiveField(3)
  Hijri? hijri;

  Date({this.readable, this.timestamp, this.gregorian, this.hijri});

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        readable: json['readable'] as String?,
        timestamp: json['timestamp'] as String?,
        gregorian: json['gregorian'] == null
            ? null
            : Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
        hijri: json['hijri'] == null
            ? null
            : Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'readable': readable,
        'timestamp': timestamp,
        'gregorian': gregorian?.toJson(),
        'hijri': hijri?.toJson(),
      };
}

@HiveType(typeId: 10)
class Datum {
  @HiveField(0)
  Timings? timings;
  @HiveField(1)
  Date? date;
  @HiveField(2)
  Meta? meta;

  Datum({this.timings, this.date, this.meta});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        timings: json['timings'] == null
            ? null
            : Timings.fromJson(json['timings'] as Map<String, dynamic>),
        date: json['date'] == null
            ? null
            : Date.fromJson(json['date'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'timings': timings?.toJson(),
        'date': date?.toJson(),
        'meta': meta?.toJson(),
      };
}

@HiveType(typeId: 11)
class Designation {
  @HiveField(0)
  String? abbreviated;
  @HiveField(1)
  String? expanded;

  Designation({this.abbreviated, this.expanded});

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        abbreviated: json['abbreviated'] as String?,
        expanded: json['expanded'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'abbreviated': abbreviated,
        'expanded': expanded,
      };
}

@HiveType(typeId: 12)
class Gregorian {
  @HiveField(0)
  String? date;
  @HiveField(1)
  String? format;
  @HiveField(2)
  String? day;
  @HiveField(3)
  Weekday? weekday;
  @HiveField(4)
  Month? month;
  @HiveField(5)
  String? year;
  @HiveField(6)
  Designation? designation;

  Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        date: json['date'] as String?,
        format: json['format'] as String?,
        day: json['day'] as String?,
        weekday: json['weekday'] == null
            ? null
            : Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
        month: json['month'] == null
            ? null
            : Month.fromJson(json['month'] as Map<String, dynamic>),
        year: json['year'] as String?,
        designation: json['designation'] == null
            ? null
            : Designation.fromJson(json['designation'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'format': format,
        'day': day,
        'weekday': weekday?.toJson(),
        'month': month?.toJson(),
        'year': year,
        'designation': designation?.toJson(),
      };
}

@HiveType(typeId: 13)
class Hijri {
  @HiveField(0)
  String? date;
  @HiveField(1)
  String? format;
  @HiveField(2)
  String? day;
  @HiveField(3)
  Weekday? weekday;
  @HiveField(4)
  Month? month;
  @HiveField(5)
  String? year;
  @HiveField(6)
  Designation? designation;
  @HiveField(7)
  List<dynamic>? holidays;

  Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
        date: json['date'] as String?,
        format: json['format'] as String?,
        day: json['day'] as String?,
        weekday: json['weekday'] == null
            ? null
            : Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
        month: json['month'] == null
            ? null
            : Month.fromJson(json['month'] as Map<String, dynamic>),
        year: json['year'] as String?,
        designation: json['designation'] == null
            ? null
            : Designation.fromJson(json['designation'] as Map<String, dynamic>),
        holidays: json['holidays'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'format': format,
        'day': day,
        'weekday': weekday?.toJson(),
        'month': month?.toJson(),
        'year': year,
        'designation': designation?.toJson(),
        'holidays': holidays,
      };
}

@HiveType(typeId: 14)
class Location {
  @HiveField(0)
  double? latitude;
  @HiveField(1)
  double? longitude;

  Location({this.latitude, this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}

@HiveType(typeId: 15)
class Meta {
  @HiveField(0)
  double? latitude;
  @HiveField(1)
  double? longitude;
  @HiveField(2)
  String? timezone;
  @HiveField(3)
  Method? method;
  @HiveField(4)
  String? latitudeAdjustmentMethod;
  @HiveField(5)
  String? midnightMode;
  @HiveField(6)
  String? school;
  @HiveField(7)
  Offset? offset;

  Meta({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
    this.offset,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        timezone: json['timezone'] as String?,
        method: json['method'] == null
            ? null
            : Method.fromJson(json['method'] as Map<String, dynamic>),
        latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'] as String?,
        midnightMode: json['midnightMode'] as String?,
        school: json['school'] as String?,
        offset: json['offset'] == null
            ? null
            : Offset.fromJson(json['offset'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'timezone': timezone,
        'method': method?.toJson(),
        'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
        'midnightMode': midnightMode,
        'school': school,
        'offset': offset?.toJson(),
      };
}

@HiveType(typeId: 16)
class Method {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  Params? params;
  @HiveField(3)
  Location? location;

  Method({this.id, this.name, this.params, this.location});

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        id: json['id'] as int?,
        name: json['name'] as String?,
        params: json['params'] == null
            ? null
            : Params.fromJson(json['params'] as Map<String, dynamic>),
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'params': params?.toJson(),
        'location': location?.toJson(),
      };
}

@HiveType(typeId: 17)
class Month {
  @HiveField(0)
  int? number;
  @HiveField(1)
  String? en;

  Month({this.number, this.en});

  factory Month.fromJson(Map<String, dynamic> json) => Month(
        number: json['number'] as int?,
        en: json['en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'en': en,
      };
}

@HiveType(typeId: 18)
class Offset {
  @HiveField(0)
  int? imsak;
  @HiveField(1)
  int? fajr;
  @HiveField(2)
  int? sunrise;
  @HiveField(3)
  int? dhuhr;
  @HiveField(4)
  int? asr;
  @HiveField(5)
  int? maghrib;
  @HiveField(6)
  int? sunset;
  @HiveField(7)
  int? isha;
  @HiveField(8)
  int? midnight;

  Offset({
    this.imsak,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.sunset,
    this.isha,
    this.midnight,
  });

  factory Offset.fromJson(Map<String, dynamic> json) => Offset(
        imsak: json['Imsak'] as int?,
        fajr: json['Fajr'] as int?,
        sunrise: json['Sunrise'] as int?,
        dhuhr: json['Dhuhr'] as int?,
        asr: json['Asr'] as int?,
        maghrib: json['Maghrib'] as int?,
        sunset: json['Sunset'] as int?,
        isha: json['Isha'] as int?,
        midnight: json['Midnight'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'Imsak': imsak,
        'Fajr': fajr,
        'Sunrise': sunrise,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Maghrib': maghrib,
        'Sunset': sunset,
        'Isha': isha,
        'Midnight': midnight,
      };
}

@HiveType(typeId: 19)
class Params {
  @HiveField(0)
  double? fajr;
  @HiveField(1)
  double? isha;

  Params({this.fajr, this.isha});

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        fajr: json['Fajr'] as double?,
        isha: json['Isha'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'Fajr': fajr,
        'Isha': isha,
      };
}

@HiveType(typeId: 20)
class Timings {
  @HiveField(0)
  String? fajr;
  @HiveField(1)
  String? sunrise;
  @HiveField(2)
  String? dhuhr;
  @HiveField(3)
  String? asr;
  @HiveField(4)
  String? sunset;
  @HiveField(5)
  String? maghrib;
  @HiveField(6)
  String? isha;
  @HiveField(7)
  String? imsak;
  @HiveField(8)
  String? midnight;
  @HiveField(9)
  String? firstthird;
  @HiveField(10)
  String? lastthird;

  Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  List<PrayerModelNow> get times => [
        PrayerModelNow(prayerName: 'Midnight', prayerDate: midnight!),
        PrayerModelNow(prayerName: 'Imsak', prayerDate: imsak!),
        PrayerModelNow(prayerName: 'Fajr', prayerDate: fajr!),
        PrayerModelNow(prayerName: 'Sunrise', prayerDate: sunrise!),
        PrayerModelNow(prayerName: 'Dhuhr', prayerDate: dhuhr!),
        PrayerModelNow(prayerName: 'Asr', prayerDate: asr!),
        PrayerModelNow(prayerName: 'Maghrib', prayerDate: maghrib!),
        PrayerModelNow(prayerName: 'Isha', prayerDate: isha!),
      ];

   List <PrayerModelNow> get fivePrayers => [
       PrayerModelNow(prayerName: 'Fajr', prayerDate: fajr!),
       PrayerModelNow(prayerName: 'Dhuhr', prayerDate: dhuhr!),
       PrayerModelNow(prayerName: 'Asr', prayerDate: asr!),
       PrayerModelNow(prayerName: 'Maghrib', prayerDate: maghrib!),
       PrayerModelNow(prayerName: 'Isha', prayerDate: isha!),
   ];   

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        fajr: json['Fajr'] as String?,
        sunrise: json['Sunrise'] as String?,
        dhuhr: json['Dhuhr'] as String?,
        asr: json['Asr'] as String?,
        sunset: json['Sunset'] as String?,
        maghrib: json['Maghrib'] as String?,
        isha: json['Isha'] as String?,
        imsak: json['Imsak'] as String?,
        midnight: json['Midnight'] as String?,
        firstthird: json['Firstthird'] as String?,
        lastthird: json['Lastthird'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Fajr': fajr,
        'Sunrise': sunrise,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Sunset': sunset,
        'Maghrib': maghrib,
        'Isha': isha,
        'Imsak': imsak,
        'Midnight': midnight,
        'Firstthird': firstthird,
        'Lastthird': lastthird,
      };
}

@HiveType(typeId: 21)
class Weekday {
  @HiveField(0)
  String? en;

  Weekday({this.en});

  factory Weekday.fromJson(Map<String, dynamic> json) => Weekday(
        en: json['en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'en': en,
      };
}

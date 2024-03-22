// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarModelAdapter extends TypeAdapter<CalendarModel> {
  @override
  final int typeId = 8;

  @override
  CalendarModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarModel(
      code: fields[0] as int?,
      status: fields[1] as String?,
      data: (fields[2] as List?)?.cast<Datum>(),
    );
  }

  @override
  void write(BinaryWriter writer, CalendarModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DateAdapter extends TypeAdapter<Date> {
  @override
  final int typeId = 9;

  @override
  Date read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Date(
      readable: fields[0] as String?,
      timestamp: fields[1] as String?,
      gregorian: fields[2] as Gregorian?,
      hijri: fields[3] as Hijri?,
    );
  }

  @override
  void write(BinaryWriter writer, Date obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.readable)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.gregorian)
      ..writeByte(3)
      ..write(obj.hijri);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DatumAdapter extends TypeAdapter<Datum> {
  @override
  final int typeId = 10;

  @override
  Datum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Datum(
      timings: fields[0] as Timings?,
      date: fields[1] as Date?,
      meta: fields[2] as Meta?,
    );
  }

  @override
  void write(BinaryWriter writer, Datum obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timings)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DesignationAdapter extends TypeAdapter<Designation> {
  @override
  final int typeId = 11;

  @override
  Designation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Designation(
      abbreviated: fields[0] as String?,
      expanded: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Designation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.abbreviated)
      ..writeByte(1)
      ..write(obj.expanded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GregorianAdapter extends TypeAdapter<Gregorian> {
  @override
  final int typeId = 12;

  @override
  Gregorian read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Gregorian(
      date: fields[0] as String?,
      format: fields[1] as String?,
      day: fields[2] as String?,
      weekday: fields[3] as Weekday?,
      month: fields[4] as Month?,
      year: fields[5] as String?,
      designation: fields[6] as Designation?,
    );
  }

  @override
  void write(BinaryWriter writer, Gregorian obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.format)
      ..writeByte(2)
      ..write(obj.day)
      ..writeByte(3)
      ..write(obj.weekday)
      ..writeByte(4)
      ..write(obj.month)
      ..writeByte(5)
      ..write(obj.year)
      ..writeByte(6)
      ..write(obj.designation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GregorianAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HijriAdapter extends TypeAdapter<Hijri> {
  @override
  final int typeId = 13;

  @override
  Hijri read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hijri(
      date: fields[0] as String?,
      format: fields[1] as String?,
      day: fields[2] as String?,
      weekday: fields[3] as Weekday?,
      month: fields[4] as Month?,
      year: fields[5] as String?,
      designation: fields[6] as Designation?,
      holidays: (fields[7] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Hijri obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.format)
      ..writeByte(2)
      ..write(obj.day)
      ..writeByte(3)
      ..write(obj.weekday)
      ..writeByte(4)
      ..write(obj.month)
      ..writeByte(5)
      ..write(obj.year)
      ..writeByte(6)
      ..write(obj.designation)
      ..writeByte(7)
      ..write(obj.holidays);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HijriAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final int typeId = 14;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      latitude: fields[0] as double?,
      longitude: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetaAdapter extends TypeAdapter<Meta> {
  @override
  final int typeId = 15;

  @override
  Meta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meta(
      latitude: fields[0] as double?,
      longitude: fields[1] as double?,
      timezone: fields[2] as String?,
      method: fields[3] as Method?,
      latitudeAdjustmentMethod: fields[4] as String?,
      midnightMode: fields[5] as String?,
      school: fields[6] as String?,
      offset: fields[7] as Offset?,
    );
  }

  @override
  void write(BinaryWriter writer, Meta obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.timezone)
      ..writeByte(3)
      ..write(obj.method)
      ..writeByte(4)
      ..write(obj.latitudeAdjustmentMethod)
      ..writeByte(5)
      ..write(obj.midnightMode)
      ..writeByte(6)
      ..write(obj.school)
      ..writeByte(7)
      ..write(obj.offset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MethodAdapter extends TypeAdapter<Method> {
  @override
  final int typeId = 16;

  @override
  Method read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Method(
      id: fields[0] as int?,
      name: fields[1] as String?,
      params: fields[2] as Params?,
      location: fields[3] as Location?,
    );
  }

  @override
  void write(BinaryWriter writer, Method obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.params)
      ..writeByte(3)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MethodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MonthAdapter extends TypeAdapter<Month> {
  @override
  final int typeId = 17;

  @override
  Month read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Month(
      number: fields[0] as int?,
      en: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Month obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OffsetAdapter extends TypeAdapter<Offset> {
  @override
  final int typeId = 18;

  @override
  Offset read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Offset(
      imsak: fields[0] as int?,
      fajr: fields[1] as int?,
      sunrise: fields[2] as int?,
      dhuhr: fields[3] as int?,
      asr: fields[4] as int?,
      maghrib: fields[5] as int?,
      sunset: fields[6] as int?,
      isha: fields[7] as int?,
      midnight: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Offset obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.imsak)
      ..writeByte(1)
      ..write(obj.fajr)
      ..writeByte(2)
      ..write(obj.sunrise)
      ..writeByte(3)
      ..write(obj.dhuhr)
      ..writeByte(4)
      ..write(obj.asr)
      ..writeByte(5)
      ..write(obj.maghrib)
      ..writeByte(6)
      ..write(obj.sunset)
      ..writeByte(7)
      ..write(obj.isha)
      ..writeByte(8)
      ..write(obj.midnight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OffsetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ParamsAdapter extends TypeAdapter<Params> {
  @override
  final int typeId = 19;

  @override
  Params read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Params(
      fajr: fields[0] as double?,
      isha: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Params obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fajr)
      ..writeByte(1)
      ..write(obj.isha);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParamsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TimingsAdapter extends TypeAdapter<Timings> {
  @override
  final int typeId = 20;

  @override
  Timings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Timings(
      fajr: fields[0] as String?,
      sunrise: fields[1] as String?,
      dhuhr: fields[2] as String?,
      asr: fields[3] as String?,
      sunset: fields[4] as String?,
      maghrib: fields[5] as String?,
      isha: fields[6] as String?,
      imsak: fields[7] as String?,
      midnight: fields[8] as String?,
      firstthird: fields[9] as String?,
      lastthird: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Timings obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.fajr)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.dhuhr)
      ..writeByte(3)
      ..write(obj.asr)
      ..writeByte(4)
      ..write(obj.sunset)
      ..writeByte(5)
      ..write(obj.maghrib)
      ..writeByte(6)
      ..write(obj.isha)
      ..writeByte(7)
      ..write(obj.imsak)
      ..writeByte(8)
      ..write(obj.midnight)
      ..writeByte(9)
      ..write(obj.firstthird)
      ..writeByte(10)
      ..write(obj.lastthird);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeekdayAdapter extends TypeAdapter<Weekday> {
  @override
  final int typeId = 21;

  @override
  Weekday read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weekday(
      en: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Weekday obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekdayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

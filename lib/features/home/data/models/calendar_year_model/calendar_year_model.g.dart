// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_year_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarYearModelAdapter extends TypeAdapter<CalendarYearModel> {
  @override
  final int typeId = 23;

  @override
  CalendarYearModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarYearModel(
      code: fields[0] as int?,
      status: fields[1] as String?,
      data: (fields[2] as Map?)?.map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as List).cast<Datum>())),
    );
  }

  @override
  void write(BinaryWriter writer, CalendarYearModel obj) {
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
      other is CalendarYearModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarYearModel _$CalendarYearModelFromJson(Map<String, dynamic> json) =>
    CalendarYearModel(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => Datum.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

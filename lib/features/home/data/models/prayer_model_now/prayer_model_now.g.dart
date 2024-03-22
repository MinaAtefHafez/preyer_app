// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_model_now.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerModelNowAdapter extends TypeAdapter<PrayerModelNow> {
  @override
  final int typeId = 22;

  @override
  PrayerModelNow read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerModelNow(
      prayerName: fields[0] as String,
      prayerDate: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PrayerModelNow obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.prayerName)
      ..writeByte(1)
      ..write(obj.prayerDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerModelNowAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerTypeModelAdapter extends TypeAdapter<PrayerTypeModel> {
  @override
  final int typeId = 7;

  @override
  PrayerTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerTypeModel(
      prayerName: fields[1] as String,
      isActiveNotification: fields[0] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PrayerTypeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isActiveNotification)
      ..writeByte(1)
      ..write(obj.prayerName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

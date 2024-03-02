// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'methods_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MethodsModelAdapter extends TypeAdapter<MethodsModel> {
  @override
  final int typeId = 1;

  @override
  MethodsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MethodsModel(
      code: fields[0] as int?,
      status: fields[1] as String?,
      data: fields[2] as MethodsDataModel,
    );
  }

  @override
  void write(BinaryWriter writer, MethodsModel obj) {
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
      other is MethodsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MethodsDataModelAdapter extends TypeAdapter<MethodsDataModel> {
  @override
  final int typeId = 2;

  @override
  MethodsDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MethodsDataModel(
      mwl: fields[0] as MethodsTypeModel?,
      isna: fields[1] as MethodsTypeModel?,
      egypt: fields[23] as MethodsTypeModel?,
      makkah: fields[22] as MethodsTypeModel?,
      karachi: fields[21] as MethodsTypeModel?,
      tehran: fields[20] as MethodsTypeModel?,
      jafari: fields[19] as MethodsTypeModel?,
      gulf: fields[18] as MethodsTypeModel?,
      kuwait: fields[17] as MethodsTypeModel?,
      qatar: fields[16] as MethodsTypeModel?,
      singapore: fields[15] as MethodsTypeModel?,
      france: fields[14] as MethodsTypeModel?,
      turkey: fields[13] as MethodsTypeModel?,
      russia: fields[12] as MethodsTypeModel?,
      moonsighting: fields[11] as MethodsTypeModel?,
      dubai: fields[10] as MethodsTypeModel?,
      jakim: fields[9] as MethodsTypeModel?,
      tunisia: fields[8] as MethodsTypeModel?,
      algeria: fields[7] as MethodsTypeModel?,
      kemenag: fields[6] as MethodsTypeModel?,
      morocco: fields[4] as MethodsTypeModel?,
      portugal: fields[5] as MethodsTypeModel?,
      custom: fields[3] as MethodsTypeModel?,
    );
  }

  @override
  void write(BinaryWriter writer, MethodsDataModel obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.mwl)
      ..writeByte(1)
      ..write(obj.isna)
      ..writeByte(3)
      ..write(obj.custom)
      ..writeByte(4)
      ..write(obj.morocco)
      ..writeByte(5)
      ..write(obj.portugal)
      ..writeByte(6)
      ..write(obj.kemenag)
      ..writeByte(7)
      ..write(obj.algeria)
      ..writeByte(8)
      ..write(obj.tunisia)
      ..writeByte(9)
      ..write(obj.jakim)
      ..writeByte(10)
      ..write(obj.dubai)
      ..writeByte(11)
      ..write(obj.moonsighting)
      ..writeByte(12)
      ..write(obj.russia)
      ..writeByte(13)
      ..write(obj.turkey)
      ..writeByte(14)
      ..write(obj.france)
      ..writeByte(15)
      ..write(obj.singapore)
      ..writeByte(16)
      ..write(obj.qatar)
      ..writeByte(17)
      ..write(obj.kuwait)
      ..writeByte(18)
      ..write(obj.gulf)
      ..writeByte(19)
      ..write(obj.jafari)
      ..writeByte(20)
      ..write(obj.tehran)
      ..writeByte(21)
      ..write(obj.karachi)
      ..writeByte(22)
      ..write(obj.makkah)
      ..writeByte(23)
      ..write(obj.egypt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MethodsDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MethodsTypeModelAdapter extends TypeAdapter<MethodsTypeModel> {
  @override
  final int typeId = 3;

  @override
  MethodsTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MethodsTypeModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      params: fields[2] as MethodsParamsModel?,
      location: fields[3] as MethodsLocationModel?,
    );
  }

  @override
  void write(BinaryWriter writer, MethodsTypeModel obj) {
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
      other is MethodsTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MethodsParamsModelAdapter extends TypeAdapter<MethodsParamsModel> {
  @override
  final int typeId = 4;

  @override
  MethodsParamsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MethodsParamsModel(
      fajr: fields[0] as dynamic,
      isha: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, MethodsParamsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fajr)
      ..writeByte(2)
      ..write(obj.isha);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MethodsParamsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MethodsLocationModelAdapter extends TypeAdapter<MethodsLocationModel> {
  @override
  final int typeId = 5;

  @override
  MethodsLocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MethodsLocationModel(
      latitude: fields[0] as double?,
      longitude: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, MethodsLocationModel obj) {
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
      other is MethodsLocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MethodsCustomModelAdapter extends TypeAdapter<MethodsCustomModel> {
  @override
  final int typeId = 6;

  @override
  MethodsCustomModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MethodsCustomModel(
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MethodsCustomModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MethodsCustomModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MethodsModel _$MethodsModelFromJson(Map<String, dynamic> json) => MethodsModel(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: MethodsDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MethodsModelToJson(MethodsModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

MethodsDataModel _$MethodsDataModelFromJson(Map<String, dynamic> json) =>
    MethodsDataModel(
      mwl: json['MWL'] == null
          ? null
          : MethodsTypeModel.fromJson(json['MWL'] as Map<String, dynamic>),
      isna: json['ISNA'] == null
          ? null
          : MethodsTypeModel.fromJson(json['ISNA'] as Map<String, dynamic>),
      egypt: json['EGYPT'] == null
          ? null
          : MethodsTypeModel.fromJson(json['EGYPT'] as Map<String, dynamic>),
      makkah: json['MAKKAH'] == null
          ? null
          : MethodsTypeModel.fromJson(json['MAKKAH'] as Map<String, dynamic>),
      karachi: json['KARACHI'] == null
          ? null
          : MethodsTypeModel.fromJson(json['KARACHI'] as Map<String, dynamic>),
      tehran: json['TEHRAN'] == null
          ? null
          : MethodsTypeModel.fromJson(json['TEHRAN'] as Map<String, dynamic>),
      jafari: json['JAFARI'] == null
          ? null
          : MethodsTypeModel.fromJson(json['JAFARI'] as Map<String, dynamic>),
      gulf: json['GULF'] == null
          ? null
          : MethodsTypeModel.fromJson(json['GULF'] as Map<String, dynamic>),
      kuwait: json['KUWAIT'] == null
          ? null
          : MethodsTypeModel.fromJson(json['KUWAIT'] as Map<String, dynamic>),
      qatar: json['QATAR'] == null
          ? null
          : MethodsTypeModel.fromJson(json['QATAR'] as Map<String, dynamic>),
      singapore: json['SINGAPORE'] == null
          ? null
          : MethodsTypeModel.fromJson(
              json['SINGAPORE'] as Map<String, dynamic>),
      france: json['FRANCE'] == null
          ? null
          : MethodsTypeModel.fromJson(json['FRANCE'] as Map<String, dynamic>),
      turkey: json['TURKEY'] == null
          ? null
          : MethodsTypeModel.fromJson(json['TURKEY'] as Map<String, dynamic>),
      russia: json['RUSSIA'] == null
          ? null
          : MethodsTypeModel.fromJson(json['RUSSIA'] as Map<String, dynamic>),
      moonsighting: json['MOONSIGHTING'] == null
          ? null
          : MethodsTypeModel.fromJson(
              json['MOONSIGHTING'] as Map<String, dynamic>),
      dubai: json['DUBAI'] == null
          ? null
          : MethodsTypeModel.fromJson(json['DUBAI'] as Map<String, dynamic>),
      jakim: json['JAKIM'] == null
          ? null
          : MethodsTypeModel.fromJson(json['JAKIM'] as Map<String, dynamic>),
      tunisia: json['TUNISIA'] == null
          ? null
          : MethodsTypeModel.fromJson(json['TUNISIA'] as Map<String, dynamic>),
      algeria: json['ALGERIA'] == null
          ? null
          : MethodsTypeModel.fromJson(json['ALGERIA'] as Map<String, dynamic>),
      kemenag: json['KEMENAG'] == null
          ? null
          : MethodsTypeModel.fromJson(json['KEMENAG'] as Map<String, dynamic>),
      morocco: json['MOROCCO'] == null
          ? null
          : MethodsTypeModel.fromJson(json['MOROCCO'] as Map<String, dynamic>),
      portugal: json['PORTUGAL'] == null
          ? null
          : MethodsTypeModel.fromJson(json['PORTUGAL'] as Map<String, dynamic>),
      custom: json['CUSTOM'] == null
          ? null
          : MethodsTypeModel.fromJson(json['CUSTOM'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MethodsDataModelToJson(MethodsDataModel instance) =>
    <String, dynamic>{
      'MWL': instance.mwl,
      'ISNA': instance.isna,
      'CUSTOM': instance.custom,
      'MOROCCO': instance.morocco,
      'PORTUGAL': instance.portugal,
      'KEMENAG': instance.kemenag,
      'ALGERIA': instance.algeria,
      'TUNISIA': instance.tunisia,
      'JAKIM': instance.jakim,
      'DUBAI': instance.dubai,
      'MOONSIGHTING': instance.moonsighting,
      'RUSSIA': instance.russia,
      'TURKEY': instance.turkey,
      'FRANCE': instance.france,
      'SINGAPORE': instance.singapore,
      'QATAR': instance.qatar,
      'KUWAIT': instance.kuwait,
      'GULF': instance.gulf,
      'JAFARI': instance.jafari,
      'TEHRAN': instance.tehran,
      'KARACHI': instance.karachi,
      'MAKKAH': instance.makkah,
      'EGYPT': instance.egypt,
    };

MethodsTypeModel _$MethodsTypeModelFromJson(Map<String, dynamic> json) =>
    MethodsTypeModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      params: json['params'] == null
          ? null
          : MethodsParamsModel.fromJson(json['params'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : MethodsLocationModel.fromJson(
              json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MethodsTypeModelToJson(MethodsTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'params': instance.params,
      'location': instance.location,
    };

MethodsParamsModel _$MethodsParamsModelFromJson(Map<String, dynamic> json) =>
    MethodsParamsModel(
      fajr: json['Fajr'],
      isha: json['Isha'],
    );

Map<String, dynamic> _$MethodsParamsModelToJson(MethodsParamsModel instance) =>
    <String, dynamic>{
      'Fajr': instance.fajr,
      'Isha': instance.isha,
    };

MethodsLocationModel _$MethodsLocationModelFromJson(
        Map<String, dynamic> json) =>
    MethodsLocationModel(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MethodsLocationModelToJson(
        MethodsLocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

MethodsCustomModel _$MethodsCustomModelFromJson(Map<String, dynamic> json) =>
    MethodsCustomModel(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$MethodsCustomModelToJson(MethodsCustomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'methods_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class MethodsModel {
  @HiveField(0)
  final int? code;
  @HiveField(1)
  final String? status;
  @HiveField(2)
  final MethodsDataModel data;

  MethodsModel({required this.code, required this.status, required this.data});

  factory MethodsModel.fromJson(Map<String, dynamic> json) =>
      _$MethodsModelFromJson(json);
}

@HiveType(typeId: 2)
@JsonSerializable()
class MethodsDataModel {
  @HiveField(0)
  @JsonKey(name: 'MWL')
  final MethodsTypeModel? mwl;
  @HiveField(1)
  @JsonKey(name: 'ISNA')
  @HiveField(2)
  final MethodsTypeModel? isna;
  @HiveField(3)
  @JsonKey(name: 'CUSTOM')
  final MethodsTypeModel? custom;
  @HiveField(4)
  @JsonKey(name: 'MOROCCO')
  final MethodsTypeModel? morocco;
  @HiveField(5)
  @JsonKey(name: 'PORTUGAL')
  final MethodsTypeModel? portugal;
  @HiveField(6)
  @JsonKey(name: 'KEMENAG')
  final MethodsTypeModel? kemenag;
  @HiveField(7)
  @JsonKey(name: 'ALGERIA')
  final MethodsTypeModel? algeria;
  @HiveField(8)
  @JsonKey(name: 'TUNISIA')
  final MethodsTypeModel? tunisia;
  @HiveField(9)
  @JsonKey(name: 'JAKIM')
  final MethodsTypeModel? jakim;
  @HiveField(10)
  @JsonKey(name: 'DUBAI')
  final MethodsTypeModel? dubai;
  @HiveField(11)
  @JsonKey(name: 'MOONSIGHTING')
  final MethodsTypeModel? moonsighting;
  @HiveField(12)
  @JsonKey(name: 'RUSSIA')
  final MethodsTypeModel? russia;
  @HiveField(13)
  @JsonKey(name: 'TURKEY')
  final MethodsTypeModel? turkey;
  @HiveField(14)
  @JsonKey(name: 'FRANCE')
  final MethodsTypeModel? france;
  @HiveField(15)
  @JsonKey(name: 'SINGAPORE')
  final MethodsTypeModel? singapore;
  @HiveField(16)
  @JsonKey(name: 'QATAR')
  final MethodsTypeModel? qatar;
  @HiveField(17)
  @JsonKey(name: 'KUWAIT')
  final MethodsTypeModel? kuwait;
  @HiveField(18)
  @JsonKey(name: 'GULF')
  final MethodsTypeModel? gulf;
  @HiveField(19)
  @JsonKey(name: 'JAFARI')
  final MethodsTypeModel? jafari;
  @HiveField(20)
  @JsonKey(name: 'TEHRAN')
  final MethodsTypeModel? tehran;
  @HiveField(21)
  @JsonKey(name: 'KARACHI')
  final MethodsTypeModel? karachi;
  @HiveField(22)
  @JsonKey(name: 'MAKKAH')
  final MethodsTypeModel? makkah;
  @HiveField(23)
  @JsonKey(name: 'EGYPT')
  final MethodsTypeModel? egypt;

  List<MethodsTypeModel> allMethods() => [
        mwl!,
        isna!,
        morocco!,
        portugal!,
        kemenag!,
        algeria!,
        tunisia!,
        jakim!,
        dubai!,
        moonsighting!,
        russia!,
        turkey!,
        france!,
        singapore!,
        qatar!,
        kuwait!,
        gulf!,
        jafari!,
        tehran!,
        karachi!,
        makkah!,
        egypt!
      ];

  MethodsDataModel(
      {required this.mwl,
      required this.isna,
      required this.egypt,
      required this.makkah,
      required this.karachi,
      required this.tehran,
      required this.jafari,
      required this.gulf,
      required this.kuwait,
      required this.qatar,
      required this.singapore,
      required this.france,
      required this.turkey,
      required this.russia,
      required this.moonsighting,
      required this.dubai,
      required this.jakim,
      required this.tunisia,
      required this.algeria,
      required this.kemenag,
      required this.morocco,
      required this.portugal,
      required this.custom});

  factory MethodsDataModel.fromJson(Map<String, dynamic> json) =>
      _$MethodsDataModelFromJson(json);
}

@HiveType(typeId: 3)
@JsonSerializable()
class MethodsTypeModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final MethodsParamsModel? params;
  @HiveField(3)
  final MethodsLocationModel? location;

  MethodsTypeModel(
      {required this.id,
      required this.name,
      required this.params,
      required this.location});

  factory MethodsTypeModel.initial() {
    return MethodsTypeModel(
      id: 5,
      name: 'Egyptian General Authority of Survey',
      params: MethodsParamsModel(fajr: 19.5, isha: 17.5),
      location:
          MethodsLocationModel(latitude: 30.0444196, longitude: 31.2357116),
    );
  }

  factory MethodsTypeModel.fromJson(Map<String, dynamic> json) =>
      _$MethodsTypeModelFromJson(json);
}

@HiveType(typeId: 4)
@JsonSerializable()
class MethodsParamsModel {
  @HiveField(0)
  @JsonKey(name: 'Fajr')
  @HiveField(1)
  final dynamic fajr;
  @HiveField(2)
  @JsonKey(name: 'Isha')
  final dynamic isha;

  MethodsParamsModel({required this.fajr, required this.isha});

  factory MethodsParamsModel.fromJson(Map<String, dynamic> json) =>
      _$MethodsParamsModelFromJson(json);
}

@HiveType(typeId: 5)
@JsonSerializable()
class MethodsLocationModel {
  @HiveField(0)
  final double? latitude;
  @HiveField(1)
  final double? longitude;
  MethodsLocationModel({required this.latitude, required this.longitude});

  factory MethodsLocationModel.fromJson(Map<String, dynamic> json) =>
      _$MethodsLocationModelFromJson(json);
}

@HiveType(typeId: 6)
@JsonSerializable()
class MethodsCustomModel {
  @HiveField(0)
  final int? id;
  MethodsCustomModel({required this.id});

  factory MethodsCustomModel.fromJson(Map<String, dynamic> json) =>
      _$MethodsCustomModelFromJson(json);
}

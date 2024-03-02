import 'package:hive/hive.dart';
part 'prayer_type_model.g.dart';

@HiveType(typeId: 7)
class PrayerTypeModel {
  @HiveField(0)
  bool? isActiveNotification;
  @HiveField(1)
  String? prayerName;

  PrayerTypeModel({this.prayerName, this.isActiveNotification = true});

  PrayerTypeModel copyWith({
    bool? isActiveNotification,
    String? prayerName,
  }) {
    this.prayerName = prayerName ?? this.prayerName;
    this.isActiveNotification =
        isActiveNotification ?? this.isActiveNotification;
    return this;
  }
}

import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
part 'user_location_model.g.dart';

@HiveType(typeId: 0)
class UserLocationModel {
  @HiveField(0)
  final double latitude;
  @HiveField(1)
  final double longitude;
  @HiveField(2)
  final String locationName;

  UserLocationModel(
      {required this.latitude,
      required this.longitude,
      required this.locationName});

  factory UserLocationModel.fromPosition(Position position) {
    return UserLocationModel(
        locationName: 'بركة النصر',
        latitude: position.latitude,
        longitude: position.longitude);
  }
}

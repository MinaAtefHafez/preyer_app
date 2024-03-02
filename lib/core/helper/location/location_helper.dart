import 'package:geolocator/geolocator.dart';

class LocationHelper {
  Future<Position> getCurrentPosition() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

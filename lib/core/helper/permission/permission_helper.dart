import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  Future<bool> _checkPermission(Permission permission) async {
    PermissionStatus status = await permission.status;
    if (status.isGranted) return status.isGranted;
    status = await permission.request();
    return status.isGranted;
  }

  Future<bool> checkLocationPermission() =>
      _checkPermission(Permission.location);
}

import 'package:geolocator/geolocator.dart';
import 'package:newf/core/shared/methods/print.dart';

class PositionHelper {
  PositionHelper._();

  static final PositionHelper _instance = PositionHelper._();
  factory PositionHelper() => _instance;
  static PositionHelper get instance => _instance;

  /// Retrieves the current device position.
  /// Handles service enabled check, permission checks and requests.
  Future<Position?> getCurrentPosition() async {
    try {
      final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        PrintHelper().ordinaryPrint('Location services are disabled.');
        return null;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        PrintHelper().ordinaryPrint('Location permissions are denied ($permission).');
        return null;
      }

      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
    } catch (e) {
      PrintHelper().ordinaryPrint('PositionHelper getCurrentPosition error: $e');
      try {
        return await Geolocator.getLastKnownPosition();
      } catch (_) {
        return null;
      }
    }
  }

  /// Returns latitude and longitude as a record `({double latitude, double longitude})?`.
  Future<({double latitude, double longitude})?> getLatLng() async {
    final position = await getCurrentPosition();
    if (position == null) return null;
    return (latitude: position.latitude, longitude: position.longitude);
  }

  /// Checks if location service is enabled.
  Future<bool> isServiceEnabled() => Geolocator.isLocationServiceEnabled();

  /// Checks if location permission is granted.
  Future<bool> hasPermission() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }
}

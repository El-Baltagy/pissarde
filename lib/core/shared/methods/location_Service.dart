import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class LatLngModel {
  final double latitude;
  final double longitude;

  const LatLngModel(this.latitude, this.longitude);
}

class LocationService {
  LocationService._();

  static final LocationService _instance = LocationService._();

  factory LocationService() => _instance;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://nominatim.openstreetmap.org/',
      headers: {
        'User-Agent': 'PissardeApp/1.0 (contact@pissarde.com)',
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  /// Get current device location
  Future<Position?> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return null;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return null;
      }

      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
    } catch (_) {
      return null;
    }
  }

  /// Reverse geocode coordinates using OpenStreetMap Nominatim
  Future<String?> reverseGeocode(double lat, double lon) async {
    try {
      final response = await _dio.get(
        'reverse',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'format': 'jsonv2',
        },
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        final displayName = data['display_name'] as String?;
        return displayName;
      }
    } catch (_) {}
    return null;
  }
}

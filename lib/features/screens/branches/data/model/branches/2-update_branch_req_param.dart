import 'dart:math';

class UpdateBranchReqParam {
  final dynamic id;
  final String name;
  // final String code;
  final String address;
  final String latitude;
  final String longitude;
  final String geofence_radius_meters;
  final String is_active;

  const UpdateBranchReqParam({
    this.id,
    required this.name,
    // required this.code,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.geofence_radius_meters,
    required this.is_active,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        // 'code': Random().nextInt(5555).toString(),
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'geofence_radius_meters': geofence_radius_meters,
        'is_active': is_active,
      };
}

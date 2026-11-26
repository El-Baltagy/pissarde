class CheckInReqParam {
  final String qr_token;
  final String latitude;
  final String longitude;
   final String target_user_id;
  final String duty_reason;

  const CheckInReqParam({
    this.qr_token = '',
    this.latitude = '0.0',
    this.longitude = '0.0',
     this.target_user_id = '',
    this.duty_reason = '',
  });

  Map<String, dynamic> toJson() {
    var map={
      'qr_token': qr_token,
      // 'latitude': '41.0784000000000020236257114447653293609619140625',
      // 'longitude': '29.01180000000000092086338554508984088897705078125',
      'latitude': latitude,
      'longitude': longitude,
      'target_user_id': target_user_id,
      'duty_reason': duty_reason,
    };
    map.removeWhere((key, value) => value.trim().isEmpty);
    return map;
  }
}

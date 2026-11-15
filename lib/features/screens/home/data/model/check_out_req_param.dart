class CheckOutReqParam {
  final String qr_token;
  final String latitude;
  final String longitude;
  final String target_user_id;

  const CheckOutReqParam({
    required this.qr_token,
    required this.latitude,
    required this.longitude,
    required this.target_user_id,
  });

  Map<String, dynamic> toJson() => {
        'qr_token': qr_token,
        'latitude': latitude,
        'longitude': longitude,
        'target_user_id': target_user_id,
      };
}

class CheckOutReqParam {
  final String qr_token;
  final String latitude;
  final String longitude;
  final String target_user_id;

  const CheckOutReqParam({
    this.qr_token = '',
    this.latitude = '0.0',
    this.longitude = '0.0',
    this.target_user_id = '',
  });

  Map<String, dynamic> toJson() => {
        'qr_token': qr_token,
        'latitude': latitude,
        'longitude': longitude,
        'target_user_id': target_user_id,
      };
}

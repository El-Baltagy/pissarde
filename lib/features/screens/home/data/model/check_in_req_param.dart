class CheckInReqParam {
  final String qr_token;
  final String latitude;
  final String longitude;
  final String idempotency_key;
  final String target_user_id;
  final String duty_reason;

  const CheckInReqParam({
    required this.qr_token,
    required this.latitude,
    required this.longitude,
    required this.idempotency_key,
    required this.target_user_id,
    required this.duty_reason,
  });

  Map<String, dynamic> toJson() => {
        'qr_token': qr_token,
        'latitude': latitude,
        'longitude': longitude,
        'idempotency_key': idempotency_key,
        'target_user_id': target_user_id,
        'duty_reason': duty_reason,
      };
}

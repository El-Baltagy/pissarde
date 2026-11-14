class CreateAttendanceCorrectionReqParam {
  final String date;
  final String requested_check_in_at;
  final String requested_check_out_at;
  final String reason;

  const CreateAttendanceCorrectionReqParam({
    required this.date,
    required this.requested_check_in_at,
    required this.requested_check_out_at,
    required this.reason,
  });

  Map<String, dynamic> toJson() => {
        'date': date,
        'requested_check_in_at': requested_check_in_at,
        'requested_check_out_at': requested_check_out_at,
        'reason': reason,
      };
}

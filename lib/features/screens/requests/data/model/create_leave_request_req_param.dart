class CreateLeaveRequestReqParam {
  final String leave_type_id;
  final String start_date;
  final String end_date;
  final String reason;
  final String emergency_phone;

  const CreateLeaveRequestReqParam({
    required this.leave_type_id,
    required this.start_date,
    required this.end_date,
    required this.reason,
    required this.emergency_phone,
  });

  Map<String, dynamic> toJson() => {
        'leave_type_id': leave_type_id,
        'start_date': start_date,
        'end_date': end_date,
        'reason': reason,
        'emergency_phone': emergency_phone,
      };
}

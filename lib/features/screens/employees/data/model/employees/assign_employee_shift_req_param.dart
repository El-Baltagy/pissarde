class AssignEmployeeShiftReqParam {
  final String shift_id;
  final String reason;
  final String effective_date;

  const AssignEmployeeShiftReqParam({
    required this.shift_id,
    required this.reason,
    required this.effective_date,
  });

  Map<String, dynamic> toJson() => {
        'shift_id': shift_id,
        'reason': reason,
        'effective_date': effective_date,
      };
}

class TransferEmployeeReqParam {
  final String to_branch_id;
  final String to_supervisor_id;
  final String reason;
  final String effective_date;

  const TransferEmployeeReqParam({
    required this.to_branch_id,
    required this.to_supervisor_id,
    required this.reason,
    required this.effective_date,
  });

  Map<String, dynamic> toJson() => {
        'to_branch_id': to_branch_id,
        'to_supervisor_id': to_supervisor_id,
        'reason': reason,
        'effective_date': effective_date,
      };
}

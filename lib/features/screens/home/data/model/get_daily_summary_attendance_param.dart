class GetDailySummaryAttendanceParam {
  final String? branch_id;

  GetDailySummaryAttendanceParam({
    required this.branch_id,
  });

  Map<String, dynamic> toJsonParameter() => {
    if(branch_id!=null)
        'branch_id': branch_id,
      };
}

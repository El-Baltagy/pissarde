class LeaveBalancesReqParam {
  final String year;

  const LeaveBalancesReqParam({
    required this.year,
  });

  Map<String, dynamic> toJson() => {
        'year': year,
      };
}

class AttendanceHistoryReqParam {
  final String month;
  final String year;
  final String per_page;
  final int? page;

  const AttendanceHistoryReqParam({
    required this.month,
    required this.year,
    required this.per_page,
    this.page,
  });

  Map<String, dynamic> toJson() => {
        'month': month,
        'year': year,
        'per_page': per_page,
        if (page != null) 'page': page! + 1,
      };
}

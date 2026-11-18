class MyLeaveRequestsReqParam {
  final String status;

  const MyLeaveRequestsReqParam({
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        'status': status,
      };
}

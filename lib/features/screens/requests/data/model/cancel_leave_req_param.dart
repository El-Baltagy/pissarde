class CancelLeaveReqParam {
  final int id;

  const CancelLeaveReqParam({required this.id});

  Map<String, dynamic> toJson() => {'id': id};
}

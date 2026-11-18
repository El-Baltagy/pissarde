class DeleteEmployeeReqParam {
  final int id;

  const DeleteEmployeeReqParam({required this.id});

  Map<String, dynamic> toJson() => {'id': id};
}

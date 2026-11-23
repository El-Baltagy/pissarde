class DeleteShiftReqParam {
  final int id;

  const DeleteShiftReqParam({required this.id});

  Map<String, dynamic> toJson() => {'id': id};
}

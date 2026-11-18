class DeleteBranchReqParam {
  final int id;

  const DeleteBranchReqParam({required this.id});

  Map<String, dynamic> toJson() => {'id': id};
}

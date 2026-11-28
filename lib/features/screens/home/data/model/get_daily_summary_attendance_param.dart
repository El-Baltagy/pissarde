class VerifyBranchQrParam {
  final String? branch_id;

  VerifyBranchQrParam({
    required this.branch_id,
  });

  Map<String, dynamic> toJsonParameter() => {
    if(branch_id!=null)
        'branch_id': branch_id,
      };
}

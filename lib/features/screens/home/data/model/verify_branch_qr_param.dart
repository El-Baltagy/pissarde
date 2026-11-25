class VerifyBranchQrParam {
  final String branch_id;
  final String branch_token;

  VerifyBranchQrParam({
    required this.branch_id,
    required this.branch_token,
  });

  Map<String, dynamic> toJson() => {
        'token': branch_token,
      };
}

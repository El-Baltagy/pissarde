class VerifyBranchQRReqParam {
  final String token;

  const VerifyBranchQRReqParam({
    required this.token,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}

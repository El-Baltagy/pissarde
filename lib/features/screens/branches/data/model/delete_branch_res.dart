class DeleteBranchRes {
  const DeleteBranchRes({required this.message, required this.success});

  final String message;
  final bool success;

  factory DeleteBranchRes.fromJson(Map<String, dynamic> json) => DeleteBranchRes(
        message: (json['message'] ?? '').toString(),
        success: json['success'] == true,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'success': success,
      };
}

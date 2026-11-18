class ReviewLeaveRequestReqParam {
  final String status;
  final String review_notes;

  const ReviewLeaveRequestReqParam({
    required this.status,
    required this.review_notes,
  });

  Map<String, dynamic> toJson() => {
        'status': status,
        'review_notes': review_notes,
      };
}

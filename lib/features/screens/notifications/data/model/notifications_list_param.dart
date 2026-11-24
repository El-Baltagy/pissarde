class NotificationsListParam {
  NotificationsListParam({this.page});

  final int? page;

  Map<String, dynamic> toJsonParameters() => {
        if (page != null) 'page': page! + 1,
      };
}

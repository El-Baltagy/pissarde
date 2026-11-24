import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/features/screens/notifications/data/model/get_notifications_res/get_notifications_res.dart';

class Pagination {
  const Pagination({
    required this.current_page,
    required this.last_page,
    required this.total,
  });

  final int current_page;
  final int last_page;
  final int total;

  PaginationInfo<T> toGetPaginationInfo<T>(T? oldDataToCombine) =>
      PaginationInfo<T>(
        currentPage: current_page,
        lastPage: last_page,
        oldDataToCombine: oldDataToCombine,
      );
}

extension NotificationsPagination on GetNotificationsRes {
  Pagination get pagination => Pagination(
        current_page: notifications.current_page,
        last_page: notifications.last_page,
        total: notifications.total,
      );
}

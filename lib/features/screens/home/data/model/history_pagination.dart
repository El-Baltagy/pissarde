import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/features/screens/home/data/model/history_attendacne_res/history_attendacne_res.dart';

class HistoryPagination {
  const HistoryPagination({
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

extension HistoryAttendancePagination on HistoryAttendacneRes {
  HistoryPagination get pagination => HistoryPagination(
        current_page: meta.current_page,
        last_page: meta.last_page,
        total: meta.total,
      );
}

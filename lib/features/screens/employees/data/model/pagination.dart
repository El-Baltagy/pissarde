import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/features/screens/employees/data/model/employees/get_all_employees_res/get_all_employees_res.dart';

/// Lightweight pagination info derived from [GetAllEmployeesRes.meta].
class Pagination {
  const Pagination({
    required this.current_page,
    required this.last_page,
    required this.per_page,
    required this.total,
  });

  final int current_page;
  final int last_page;
  final int per_page;
  final int total;

  PaginationInfo<T> toGetPaginationInfo<T>(T? oldDataToCombine) =>
      PaginationInfo<T>(
        currentPage: current_page,
        lastPage: last_page,
        oldDataToCombine: oldDataToCombine,
      );
}

extension EmployeesPagination on GetAllEmployeesRes {
  Pagination get pagination => Pagination(
        current_page: meta.current_page,
        last_page: meta.last_page,
        per_page: meta.per_page,
        total: meta.total,
      );
}

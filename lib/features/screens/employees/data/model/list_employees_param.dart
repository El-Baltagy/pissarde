/// Parameter object for listing employees, carrying an optional page number
/// used for pagination (mirrors the market_prices SubCatogeriesInput pattern).
class EmployeesListParam {
  EmployeesListParam({this.page});

  final int? page;

  Map<String, dynamic> toJsonParameters() => {
        if (page != null) 'page': page! + 1,
          // 'per_page': '10',
      };
}

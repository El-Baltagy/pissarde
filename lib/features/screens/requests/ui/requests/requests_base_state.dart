part of 'requests_screen.dart';

abstract class RequestsPageBaseState extends State<RequestsPage>
    with SingleTickerProviderStateMixin {
  late final RequestsCubit requestsCubit;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    requestsCubit = RequestsCubit.get(context: context);
    requestsCubit.getMyLeaveRequestsFunc(Init());
    requestsCubit.getLeaveTypesFunc(Init());
    requestsCubit.getLeaveBalancesFunc(
      Init(),
      parameter: LeaveBalancesReqParam(year: DateTime.now().year.toString()),
    );

  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _listener(BuildContext context, RequestsState state) {
    if (state is RequestsLoaded) {
      // Cancel success
      if (state.cancelLeaveRequestState is Success) {
        requestsCubit.resetCancelLeaveRequest();
        requestsCubit.getMyLeaveRequestsFunc(Reload());
        requestsCubit.getLeaveBalancesFunc(
          Reload(),
          parameter: LeaveBalancesReqParam(year: DateTime.now().year.toString()),
        );
        context.showToast('leave_cancelled_success'.tr());
      } else if (state.cancelLeaveRequestState is ErrorState) {
        final err = state.cancelLeaveRequestState as ErrorState;
        requestsCubit.resetCancelLeaveRequest();
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}

part of 'pending_approvals_screen.dart';

abstract class PendingApprovalsPageBaseState extends State<PendingApprovalsPage> {
  late final RequestsCubit requestsCubit;

  @override
  void initState() {

    requestsCubit = widget.args.requestsCubit??RequestsCubit.get(context: context);
    super.initState();
    requestsCubit.resetReviewLeaveRequest();
    requestsCubit.getPendingApprovalLeavesFunc(Init());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener(BuildContext context, RequestsState state) {
    if (state is RequestsLoaded) {
      if (state.reviewLeaveRequestState is Success) {
        requestsCubit.resetReviewLeaveRequest();
        requestsCubit.getPendingApprovalLeavesFunc(Reload());
        context.showToast('leave_reviewed_success'.tr());
      } else if (state.reviewLeaveRequestState is ErrorState) {
        final err = state.reviewLeaveRequestState as ErrorState;
        requestsCubit.resetReviewLeaveRequest();
        context.showToast(err.failure.message, isSuccess: false);
      }
    }
  }
}

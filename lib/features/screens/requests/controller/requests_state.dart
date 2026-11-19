part of 'requests_cubit.dart';

@immutable
abstract class RequestsState {}

class RequestsLoaded extends RequestsState {

  RequestsLoaded({
    this.getPendingApprovalLeavesState,
    this.reviewLeaveRequestState,
    this.cancelLeaveRequestState,
    this.createLeaveRequestState,
    this.getLeaveBalancesState,
    this.getLeaveTypesState,
    this.getMyLeaveRequestsState,
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit , getMyLeaveRequestsState, getLeaveTypesState, getLeaveBalancesState, createLeaveRequestState, cancelLeaveRequestState, reviewLeaveRequestState, getPendingApprovalLeavesState;
  final RequestsState? refreshOrInit;

  RequestsLoaded copyWith({
    BaseEmit? getPendingApprovalLeavesState,
    BaseEmit? reviewLeaveRequestState,
    BaseEmit? cancelLeaveRequestState,
    BaseEmit? createLeaveRequestState,
    BaseEmit? getLeaveBalancesState,
    BaseEmit? getLeaveTypesState,
    BaseEmit? getMyLeaveRequestsState,
    BaseEmit? allWorkersEmit, 
    RequestsState? refreshOrInit,
    bool clearCreateLeaveRequest = false,
    bool clearCancelLeaveRequest = false,
    bool clearReviewLeaveRequest = false,
  }) {
    return RequestsLoaded(
      getPendingApprovalLeavesState: getPendingApprovalLeavesState ?? this.getPendingApprovalLeavesState,
      reviewLeaveRequestState: clearReviewLeaveRequest ? null : reviewLeaveRequestState ?? this.reviewLeaveRequestState,
      cancelLeaveRequestState: clearCancelLeaveRequest ? null : cancelLeaveRequestState ?? this.cancelLeaveRequestState,
      createLeaveRequestState: clearCreateLeaveRequest ? null : createLeaveRequestState ?? this.createLeaveRequestState,
      getLeaveBalancesState: getLeaveBalancesState ?? this.getLeaveBalancesState,
      getLeaveTypesState: getLeaveTypesState ?? this.getLeaveTypesState,
      getMyLeaveRequestsState: getMyLeaveRequestsState ?? this.getMyLeaveRequestsState,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 

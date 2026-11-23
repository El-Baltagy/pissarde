part of 'branches_cubit.dart';

@immutable
abstract class BranchesState {}

class BranchesLoaded extends BranchesState {
  BranchesLoaded({
    this.addEditBranchState,
    this.deleteBranchState,
    this.getListBranchesState,
    this.allWorkersEmit,
    this.refreshOrInit,
  });

  final BaseEmit? allWorkersEmit,
      getListBranchesState,
      addEditBranchState,
      deleteBranchState;
  final BranchesState? refreshOrInit;

  BranchesLoaded copyWith({
    BaseEmit? addEditBranchState,
    BaseEmit? deleteBranchState,
    BaseEmit? getListBranchesState,
    BaseEmit? allWorkersEmit,
    BranchesState? refreshOrInit,
    bool resetMutationStates = false,
  }) {
    return BranchesLoaded(
      addEditBranchState: resetMutationStates
          ? null
          : (addEditBranchState ?? this.addEditBranchState),
      deleteBranchState: resetMutationStates
          ? null
          : (deleteBranchState ?? this.deleteBranchState),
      getListBranchesState: getListBranchesState ?? this.getListBranchesState,
      allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
    );
  }
}

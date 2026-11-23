part of 'shifts_cubit.dart';

@immutable
abstract class ShiftsState {}

class ShiftsLoaded extends ShiftsState {
  ShiftsLoaded({
    this.addEditShiftState,
    this.deleteShiftState,
    this.getListShiftsState,
    this.allWorkersEmit,
    this.refreshOrInit,
  });

  final BaseEmit? allWorkersEmit,
      getListShiftsState,
      addEditShiftState,
      deleteShiftState;
  final ShiftsState? refreshOrInit;

  ShiftsLoaded copyWith({
    BaseEmit? addEditShiftState,
    BaseEmit? deleteShiftState,
    BaseEmit? getListShiftsState,
    BaseEmit? allWorkersEmit,
    ShiftsState? refreshOrInit,
    bool resetMutationStates = false,
  }) {
    return ShiftsLoaded(
      addEditShiftState: resetMutationStates
          ? null
          : (addEditShiftState ?? this.addEditShiftState),
      deleteShiftState: resetMutationStates
          ? null
          : (deleteShiftState ?? this.deleteShiftState),
      getListShiftsState: getListShiftsState ?? this.getListShiftsState,
      allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
    );
  }
}

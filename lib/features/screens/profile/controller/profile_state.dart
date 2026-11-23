part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileLoaded extends ProfileState {
  ProfileLoaded({
    this.getListHolidaysState,
    this.allWorkersEmit,
    this.refreshOrInit,
  });

  final BaseEmit? allWorkersEmit, getListHolidaysState;
  final ProfileState? refreshOrInit;

  ProfileLoaded copyWith({
    BaseEmit? getListHolidaysState,
    BaseEmit? allWorkersEmit,
    ProfileState? refreshOrInit,
  }) {
    return ProfileLoaded(
      getListHolidaysState: getListHolidaysState ?? this.getListHolidaysState,
      allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
    );
  }
}

part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileLoaded extends ProfileState {

  ProfileLoaded({
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit ;
  final ProfileState? refreshOrInit;

  ProfileLoaded copyWith({
    BaseEmit? allWorkersEmit, 
    ProfileState? refreshOrInit,
  }) {
    return ProfileLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 

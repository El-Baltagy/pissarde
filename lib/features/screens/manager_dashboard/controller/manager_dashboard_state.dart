part of 'manager_dashboard_cubit.dart';

@immutable
abstract class ManagerDashboardState {}

class ManagerDashboardLoaded extends ManagerDashboardState {

  ManagerDashboardLoaded({
     this.allWorkersEmit,
    this.refreshOrInit,
   });
  final BaseEmit? allWorkersEmit ;
  final ManagerDashboardState? refreshOrInit;

  ManagerDashboardLoaded copyWith({
    BaseEmit? allWorkersEmit, 
    ManagerDashboardState? refreshOrInit,
  }) {
    return ManagerDashboardLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
     );
  }
}

 

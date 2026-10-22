 import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/manager_dashboard/service/base_manager_dashboard_service.dart';
part 'manager_dashboard_state.dart';

class ManagerDashboardCubit extends BaseCubit<ManagerDashboardState> {
   ManagerDashboardCubit(this._service) : super(ManagerDashboardLoaded()) ;

  /// Depends on the abstraction [BaseManagerDashboardService], not on a concrete implementation.
  final BaseManagerDashboardService _service;
  
     static ManagerDashboardCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
    // Always holds the latest combined state — used by copyWith
   ManagerDashboardLoaded get _current => state is ManagerDashboardLoaded
       ? state as ManagerDashboardLoaded
       : ManagerDashboardLoaded();
       
    @override
  Future<void> init() async {
     // TODO: implement init

   }
  
}

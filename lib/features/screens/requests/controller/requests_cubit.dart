 import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/requests/service/base_requests_service.dart';
part 'requests_state.dart';

class RequestsCubit extends BaseCubit<RequestsState> {
   RequestsCubit(this._service) : super(RequestsLoaded()) ;

  /// Depends on the abstraction [BaseRequestsService], not on a concrete implementation.
  final BaseRequestsService _service;
  
     static RequestsCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
    // Always holds the latest combined state — used by copyWith
   RequestsLoaded get _current => state is RequestsLoaded
       ? state as RequestsLoaded
       : RequestsLoaded();
       
    @override
  Future<void> init() async {
     // TODO: implement init

   }
  
}

 import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/home/service/base_home_service.dart';
part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
   HomeCubit(this._service) : super(HomeLoaded()) ;

  /// Depends on the abstraction [BaseHomeService], not on a concrete implementation.
  final BaseHomeService _service;
  
     static HomeCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
    // Always holds the latest combined state — used by copyWith
   HomeLoaded get _current => state is HomeLoaded
       ? state as HomeLoaded
       : HomeLoaded();
       
    @override
  Future<void> init() async {
     // TODO: implement init

   }
  
}

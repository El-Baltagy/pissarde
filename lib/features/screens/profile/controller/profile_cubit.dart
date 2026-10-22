 import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/main.dart';
import 'package:newf/features/screens/profile/service/base_profile_service.dart';
part 'profile_state.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
   ProfileCubit(this._service) : super(ProfileLoaded()) ;

  /// Depends on the abstraction [BaseProfileService], not on a concrete implementation.
  final BaseProfileService _service;
  
     static ProfileCubit get({BuildContext? context,bool listen=false}) =>
      BlocProvider.of(context??navigatorKey.currentContext!,listen: listen);
  
    // Always holds the latest combined state — used by copyWith
   ProfileLoaded get _current => state is ProfileLoaded
       ? state as ProfileLoaded
       : ProfileLoaded();
       
    @override
  Future<void> init() async {
     // TODO: implement init

   }
  
}

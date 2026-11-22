import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/features/screens/on_boarding/service/base_on_boarding_service.dart';
import 'package:newf/main.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends BaseCubit<OnBoardingState> {
  OnBoardingCubit(this._service) : super(OnBoardingLoaded());

  /// Depends on the abstraction [BaseOnBoardingService], not on a concrete implementation.
  // ignore: unused_field
  final BaseOnBoardingService _service;

  static OnBoardingCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  // Always holds the latest combined state — used by copyWith
  // ignore: unused_element
  OnBoardingLoaded get _current =>
      state is OnBoardingLoaded ? state as OnBoardingLoaded : OnBoardingLoaded();

  @override
  Future<void> init() async {}


}

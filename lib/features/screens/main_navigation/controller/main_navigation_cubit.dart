import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/features/screens/main_navigation/service/base_main_navigation_service.dart';
import 'package:newf/main.dart';

part 'main_navigation_state.dart';

class MainNavigationCubit extends BaseCubit<MainNavigationState> {
  MainNavigationCubit(this._service) : super(MainNavigationLoaded());

  /// Depends on the abstraction [BaseMainNavigationService], not on a concrete implementation.
  // ignore: unused_field
  final BaseMainNavigationService _service;

  static MainNavigationCubit get({BuildContext? context, bool listen = false}) =>
      BlocProvider.of(context ?? navigatorKey.currentContext!, listen: listen);

  // Always holds the latest combined state — used by copyWith
  MainNavigationLoaded get _current => state is MainNavigationLoaded
      ? state as MainNavigationLoaded
      : MainNavigationLoaded();

  @override
  Future<void> init() async {}

  /// Updates the active tab index for the bottom navigation bar.
  void changeTab(int index) {
    if (_current.selectedIndex == index) return;
    emit(_current.copyWith(selectedIndex: index));
  }
}

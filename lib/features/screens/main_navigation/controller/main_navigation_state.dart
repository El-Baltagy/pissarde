part of 'main_navigation_cubit.dart';

@immutable
abstract class MainNavigationState {}

class MainNavigationLoaded extends MainNavigationState {
  MainNavigationLoaded({
    this.allWorkersEmit,
    this.refreshOrInit,
    this.selectedIndex = 0,
  });

  final BaseEmit? allWorkersEmit;
  final MainNavigationState? refreshOrInit;
  final int selectedIndex;

  MainNavigationLoaded copyWith({
    BaseEmit? allWorkersEmit,
    MainNavigationState? refreshOrInit,
    int? selectedIndex,
  }) {
    return MainNavigationLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
      allWorkersEmit: allWorkersEmit ?? this.allWorkersEmit,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}

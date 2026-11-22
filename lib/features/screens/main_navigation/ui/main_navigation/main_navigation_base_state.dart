part of 'main_navigation_screen.dart';

abstract class MainNavigationPageBaseState extends State<MainNavigationPage> {
  late final MainNavigationCubit mainNavigationCubit;
  late final LoginCubit loginCubit;

  @override
  void initState() {
    mainNavigationCubit = MainNavigationCubit.get(context: context);
    loginCubit = LoginCubit.get(context: context);
    loginCubit.getProfileFunc(Init());

    if (MainNavigationCubit.pendingTabIndex != null) {
      final initialTab = MainNavigationCubit.pendingTabIndex!;
      MainNavigationCubit.pendingTabIndex = null;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        mainNavigationCubit.changeTab(initialTab);
        NotificationsCubit.instance?.getNotificationFunc(Reload());
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

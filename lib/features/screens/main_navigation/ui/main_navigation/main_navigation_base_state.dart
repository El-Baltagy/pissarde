part of 'main_navigation_screen.dart';

abstract class MainNavigationPageBaseState extends State<MainNavigationPage> {
  late final MainNavigationCubit mainNavigationCubit;

  @override
  void initState() {
    mainNavigationCubit = MainNavigationCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

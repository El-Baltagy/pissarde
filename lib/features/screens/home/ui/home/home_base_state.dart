part of 'home_screen.dart';

abstract class HomePageBaseState extends State<HomePage> {
  late final HomeCubit homeCubit;

  @override
  void initState() {
    homeCubit = HomeCubit.get(context: context);
    super.initState();
    homeCubit.init();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

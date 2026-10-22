part of 'home_screen.dart';

abstract class HomePageBaseState extends State<HomePage> {
  late final HomeCubit homeCubit;

  @override
  void initState() {
    homeCubit = HomeCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

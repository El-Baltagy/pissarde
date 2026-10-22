part of 'profile_screen.dart';

abstract class ProfilePageBaseState extends State<ProfilePage> {
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    profileCubit = ProfileCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

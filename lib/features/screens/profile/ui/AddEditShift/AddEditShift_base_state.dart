part of 'AddEditShift_screen.dart';

abstract class AddEditShiftPageBaseState extends State<AddEditShiftPage> {
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

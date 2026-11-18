part of 'AddEditBranch_screen.dart';

abstract class AddEditBranchPageBaseState extends State<AddEditBranchPage> {
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

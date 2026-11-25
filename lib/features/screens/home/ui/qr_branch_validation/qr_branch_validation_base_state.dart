part of 'qr_branch_validation_screen.dart';

abstract class QrBranchValidationPageBaseState extends State<QrBranchValidationPage> {
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

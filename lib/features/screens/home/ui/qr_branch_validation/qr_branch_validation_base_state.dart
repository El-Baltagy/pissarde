part of 'qr_branch_validation_screen.dart';

abstract class QrBranchValidationPageBaseState
    extends State<QrBranchValidationPage> {
  late final HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

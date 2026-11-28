part of 'home_screen.dart';

abstract class HomePageBaseState extends State<HomePage> {
  late final HomeCubit homeCubit;

  @override
  void initState() {
    homeCubit = HomeCubit.get(context: context);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await homeCubit.init();
      if (StorageHelper.isAdminOrHrOrSupervisor && mounted) {
        homeCubit.attendanceSummaryFunc(
          Init(),
          parameter: GetDailySummaryAttendanceParam(branch_id: null),
        );
        context.read<BranchesCubit>().getListBranchesFunc(Init());
      }
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

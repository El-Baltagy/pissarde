part of 'home_screen.dart';

abstract class HomePageBaseState extends State<HomePage> {
  late final HomeCubit homeCubit;
  final ValueNotifier<bool> isGridOptionsNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    homeCubit = HomeCubit.get(context: context);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await homeCubit.init();
      if (StorageHelper.isAdminOrHrOrSupervisor && mounted) {
        final defaultBranchId = StorageHelper.isSupervisor
            ? StorageHelper.userData?.branch?.id.toString()
            : null;
        homeCubit.attendanceSummaryFunc(
          Init(),
          parameter: GetDailySummaryAttendanceParam(branch_id: defaultBranchId),
        );
        if (!StorageHelper.isSupervisor) {
          context.read<BranchesCubit>().getListBranchesFunc(Init());
        }
      }
    });

  }

  @override
  void dispose() {
    isGridOptionsNotifier.dispose();
    super.dispose();
  }
}

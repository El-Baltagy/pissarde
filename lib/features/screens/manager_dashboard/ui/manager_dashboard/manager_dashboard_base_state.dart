part of 'manager_dashboard_screen.dart';

abstract class ManagerDashboardPageBaseState extends State<ManagerDashboardPage> {
  late final ManagerDashboardCubit managerDashboardCubit;

  @override
  void initState() {
    managerDashboardCubit = ManagerDashboardCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

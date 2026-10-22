import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/ui/home/widgets/attendance_action_section_widget.dart';
import 'package:newf/features/screens/home/ui/home/widgets/attendance_header_widget.dart';
import 'package:newf/features/screens/home/ui/home/widgets/branch_status_card_widget.dart';
import 'package:newf/features/screens/home/ui/home/widgets/current_shift_card_widget.dart';
import 'package:newf/features/screens/home/ui/home/widgets/gps_verification_card_widget.dart';
import 'package:newf/features/screens/home/ui/home/widgets/policy_notice_card_widget.dart';
import 'package:newf/features/screens/home/ui/home/widgets/recent_requests_card_widget.dart';
import 'package:newf/features/screens/home/ui/home/widgets/role_selector_widget.dart';
import 'package:newf/features/screens/home/ui/home/widgets/weekly_summary_card_widget.dart';

part 'home_base_state.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key, required this.args});
  final HomeRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => AppLocator()()(),
      child: this,
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomePageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        body: SingleChildScrollView(
          child: Column(
            spacing:16 ,
            children: [
              Semantics(
                label: 'Attendance Header Section',
                child: const AttendanceHeaderWidget(),
              ),

              Semantics(
                label: 'Role Selector Switch',
                child: const RoleSelectorWidget(),
              ),

              Semantics(
                label: 'Branch Status Overview',
                child: const BranchStatusCardWidget(),
              ),

              Semantics(
                label: 'Current Shift Details',
                child: const CurrentShiftCardWidget(),
              ),

              Semantics(
                label: 'GPS Geolocation Verification',
                child: const GpsVerificationCardWidget(),
              ),

              Semantics(
                label: 'Check Out Action Section',
                child: const AttendanceActionSectionWidget(),
              ),

              Semantics(
                label: 'Weekly Performance Summary',
                child: const WeeklySummaryCardWidget(),
              ),

              Semantics(
                label: 'Recent Requests and Alerts',
                child: const RecentRequestsCardWidget(),
              ),

              Semantics(
                label: 'Attendance and Delay Policy',
                child: const PolicyNoticeCardWidget(),
              ),
              8.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

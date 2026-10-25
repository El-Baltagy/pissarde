import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/attendance_record/ui/attendance_record/attendance_record_screen.dart';
import 'package:newf/features/screens/home/ui/home/home_screen.dart';
import 'package:newf/features/screens/main_navigation/controller/main_navigation_cubit.dart';
import 'package:newf/features/screens/main_navigation/ui/main_navigation/widgets/custom_bottom_nav_bar.dart';
import 'package:newf/features/screens/manager_dashboard/ui/manager_dashboard/manager_dashboard_screen.dart';
import 'package:newf/features/screens/profile/ui/profile/profile_screen.dart';
import 'package:newf/features/screens/requests/ui/requests/requests_screen.dart';

part 'main_navigation_base_state.dart';

@RoutePage()
class MainNavigationPage extends StatefulWidget implements AutoRouteWrapper {
  const MainNavigationPage({super.key, required this.args});
  final MainNavigationRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<MainNavigationCubit>(
      create: (context) => AppLocator()()(),
      child: this,
    );
  }

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends MainNavigationPageBaseState {
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(args: HomeRouteArgs()).wrappedRoute(context),
      const AttendanceRecordPage(args: AttendanceRecordRouteArgs()).wrappedRoute(context),
      const RequestsPage(args: RequestsRouteArgs()).wrappedRoute(context),
      const ManagerDashboardPage(args: ManagerDashboardRouteArgs()).wrappedRoute(context),
      const ProfilePage(args: ProfileRouteArgs()).wrappedRoute(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainNavigationCubit, MainNavigationState>(
      builder: (context, state) {
        final selectedIndex = state is MainNavigationLoaded ? state.selectedIndex : 0;
        final isManagerTabSelected = selectedIndex == 3;

        return Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: selectedIndex,
            children: _pages,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Semantics(
            label: 'nav_manager_dashboard'.tr(),
            button: true,
            selected: isManagerTabSelected,
            child: SizedBox(
              width: AppSizes.s56,
              height: AppSizes.s56,
              child: FloatingActionButton(
                onPressed: () {
                  mainNavigationCubit.changeTab(3);
                },
                elevation: AppSizes.s4,
                backgroundColor: isManagerTabSelected
                    ? AppColors.primaryGoldStart
                    : AppColors.headerBackground,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.grid_view_rounded,
                  color: AppColors.roleSwitchSelectedBg,
                  size: AppSizes.s28,
                ),
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              mainNavigationCubit.changeTab(index);
            },
          ),
        );
      },
    );
  }
}

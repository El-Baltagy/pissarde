import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/attendance_record/ui/attendance_record/attendance_record_screen.dart';
import 'package:newf/features/screens/home/ui/home/home_screen.dart';
import 'package:newf/features/screens/login/controller/login_state.dart';
import 'package:newf/features/screens/main_navigation/controller/main_navigation_cubit.dart';
import 'package:newf/features/screens/main_navigation/ui/main_navigation/widgets/custom_bottom_nav_bar.dart';
import 'package:newf/features/screens/manager_dashboard/ui/manager_dashboard/manager_dashboard_screen.dart';
import 'package:newf/features/screens/profile/ui/profile/profile_screen.dart';
import 'package:newf/features/screens/requests/ui/requests/requests_screen.dart';

import '../../../login/controller/login_cubit.dart';
import 'package:newf/core/extension/context.dart';

part 'main_navigation_base_state.dart';

@RoutePage()
class MainNavigationPage extends StatefulWidget implements AutoRouteWrapper {
  const MainNavigationPage({super.key, required this.args});
  final MainNavigationRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainNavigationCubit>(
          create: (context) => AppLocator()()(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => AppLocator()()(),
        ),
      ],
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
      ProfilePage(args: ProfileRouteArgs(
        LoginCubit.get(context: context),
      )).wrappedRoute(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => current is GetProfileState,
      builder: (context, loginState) {
        if (loginState is GetProfileState) {
          if (loginState.baseEmit is Loading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (loginState.baseEmit is ErrorState) {
            final failure = (loginState.baseEmit as ErrorState).failure;
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: AppSizes.s16,
                    children: [
                      const Icon(
                        Icons.error_outline_rounded,
                        color: AppColors.notificationRed,
                        size: AppSizes.s48,
                      ),
                      Text(
                        failure.message,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.font14Regular,
                      ),
                      ElevatedButton(
                        onPressed: () => loginCubit.getProfileFunc(Reload()),
                        child: const Text('إعادة المحاولة'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }

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
                        : context.theme.primaryColor,
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
      },
    );
  }
}

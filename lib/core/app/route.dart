import 'package:auto_route/auto_route.dart';
import 'package:newf/features/screens/main_navigation/ui/main_navigation/main_navigation_screen.dart';
import 'package:newf/features/screens/home/ui/home/home_screen.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/requests/ui/requests/requests_screen.dart';
import 'package:newf/features/screens/profile/ui/profile/profile_screen.dart';
import 'package:newf/features/screens/profile/ui/employees/employees_screen.dart';
import 'package:newf/features/screens/profile/ui/shifts/shifts_screen.dart';
import 'package:newf/features/screens/profile/ui/branches/branches_screen.dart';
import 'package:newf/features/screens/profile/ui/official_holidays/official_holidays_screen.dart';
import 'package:newf/features/screens/login/ui/login/login_screen.dart';
import 'package:newf/features/screens/splash/ui/splash_screen.dart';

import '../../features/screens/login/controller/login_cubit.dart';
import '../../features/screens/notifications/controller/notifications_cubit.dart';
import '../storage/storage_helper.dart';
import 'package:newf/features/screens/profile/ui/AddEditShift/AddEditShift_screen.dart';
import 'package:newf/features/screens/profile/data/model/shifts/get_all_shifts_res/get_all_shifts_res.dart';
import 'package:newf/features/screens/profile/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/profile/data/model/employees/get_all_employees_res/get_all_employees_res.dart'
    as emp;
import 'package:newf/features/screens/profile/ui/AddEditBranch/AddEditBranch_screen.dart';
import 'package:newf/features/screens/profile/ui/AddEditEmloyee/AddEditEmloyee_screen.dart';
import 'package:newf/features/screens/notifications/ui/notifications/notifications_screen.dart';
import 'package:newf/features/screens/requests/ui/AddLeaveRequest/AddLeaveRequest_screen.dart';
import 'package:newf/features/screens/requests/ui/PendingApprovals/pending_approvals_screen.dart';
import 'package:newf/features/screens/requests/data/model/get_leaves_types_res/get_leaves_types_res.dart';
import 'package:newf/features/screens/requests/controller/requests_cubit.dart';
import 'package:newf/features/screens/profile/ui/privacy_policy/privacy_policy_screen.dart';
import 'package:newf/features/screens/on_boarding/ui/on_boarding/on_boarding_screen.dart';

part 'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: OnBoardingRoute.page,
      // initial: true,
    ),
    AutoRoute(
      page: PrivacyPolicyRoute.page,
      // initial: true,
    ),
    AutoRoute(
      page: NotificationsRoute.page,
      // initial: true,
    ),
    AutoRoute(
      page: AddEditEmloyeeRoute.page,
      // initial: true,
    ),
    AutoRoute(
      page: AddEditBranchRoute.page,
      // initial: true,
    ),
    AutoRoute(
      page: AddEditShiftRoute.page,
      // initial: true,
    ),
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: MainNavigationRoute.page, guards: [AuthGuard()]),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: RequestsRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: EmployeesRoute.page),
    AutoRoute(page: ShiftsRoute.page),
    AutoRoute(page: BranchesRoute.page),
    AutoRoute(page: OfficialHolidaysRoute.page),
    AutoRoute(page: AddLeaveRequestRoute.page),
    AutoRoute(page: PendingApprovalsRoute.page),
  ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!StorageHelper.hasViewedOnboarding) {
      router.replace(OnBoardingRoute(args: OnBoardingRouteArgs()));
    } else if (!StorageHelper.isLogined) {
      router.replace(const LoginRoute());
    } else {
      resolver.next();
    }
  }
}

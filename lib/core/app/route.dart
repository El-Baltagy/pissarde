import 'package:auto_route/auto_route.dart';
import 'package:newf/features/screens/main_navigation/ui/main_navigation/main_navigation_screen.dart';
import 'package:newf/features/screens/home/ui/home/home_screen.dart';
import 'package:newf/features/screens/attendance_record/ui/attendance_record/attendance_record_screen.dart';
import 'package:newf/features/screens/requests/ui/requests/requests_screen.dart';
import 'package:newf/features/screens/manager_dashboard/ui/manager_dashboard/manager_dashboard_screen.dart';
import 'package:newf/features/screens/profile/ui/profile/profile_screen.dart';
part  'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
      AutoRoute(
        page: MainNavigationRoute.page,
        initial: true,
      ),
      AutoRoute(
        page: HomeRoute.page,
      ),
      AutoRoute(
        page: AttendanceRecordRoute.page,
      ),
      AutoRoute(
        page: RequestsRoute.page,
      ),
      AutoRoute(
        page: ManagerDashboardRoute.page,
      ),
      AutoRoute(
        page: ProfileRoute.page,
      ),
  ];
}
// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     final isLoggedIn = false; // check your auth state
//     if (isLoggedIn) {
//       resolver.next(true);
//     } else {
//       router.replace(const AuthRoute());
//     }
//   }
// }
      
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(orElse: () =>   ProfileRouteArgs.noArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ProfilePage(
           args: args ,
        )),
      );
    },
    ManagerDashboardRoute.name: (routeData) {
      final args = routeData.argsAs<ManagerDashboardRouteArgs>(orElse: () =>   ManagerDashboardRouteArgs.noArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ManagerDashboardPage(
           args: args ,
        )),
      );
    },
    RequestsRoute.name: (routeData) {
      final args = routeData.argsAs<RequestsRouteArgs>(orElse: () =>   RequestsRouteArgs.noArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: RequestsPage(
           args: args ,
        )),
      );
    },
    AttendanceRecordRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceRecordRouteArgs>(orElse: () =>   AttendanceRecordRouteArgs.noArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AttendanceRecordPage(
           args: args ,
        )),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>(orElse: () =>   HomeRouteArgs.noArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: HomePage(
           args: args ,
        )),
      );
    },
    MainNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<MainNavigationRouteArgs>(orElse: () =>   MainNavigationRouteArgs.noArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: MainNavigationPage(
           args: args ,
        )),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const LoginPage()),
      );
    },
  };
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainNavigationPage]
class MainNavigationRoute extends PageRouteInfo<MainNavigationRouteArgs> {
  MainNavigationRoute({
   required MainNavigationRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    MainNavigationRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'MainNavigationRoute';

  static const PageInfo<MainNavigationRouteArgs> page =
  PageInfo<MainNavigationRouteArgs>(name);
}
class MainNavigationRouteArgs {
  const MainNavigationRouteArgs( );
   static MainNavigationRouteArgs noArgs()=>MainNavigationRouteArgs();
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
   required HomeRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    HomeRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page =
  PageInfo<HomeRouteArgs>(name);
}
class HomeRouteArgs {
  const HomeRouteArgs( );
   static HomeRouteArgs noArgs()=>HomeRouteArgs();
}

/// generated route for
/// [AttendanceRecordPage]
class AttendanceRecordRoute extends PageRouteInfo<AttendanceRecordRouteArgs> {
  AttendanceRecordRoute({
   required AttendanceRecordRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    AttendanceRecordRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'AttendanceRecordRoute';

  static const PageInfo<AttendanceRecordRouteArgs> page =
  PageInfo<AttendanceRecordRouteArgs>(name);
}
class AttendanceRecordRouteArgs {
  const AttendanceRecordRouteArgs( );
   static AttendanceRecordRouteArgs noArgs()=>AttendanceRecordRouteArgs();
}

/// generated route for
/// [RequestsPage]
class RequestsRoute extends PageRouteInfo<RequestsRouteArgs> {
  RequestsRoute({
   required RequestsRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    RequestsRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'RequestsRoute';

  static const PageInfo<RequestsRouteArgs> page =
  PageInfo<RequestsRouteArgs>(name);
}
class RequestsRouteArgs {
  const RequestsRouteArgs( );
   static RequestsRouteArgs noArgs()=>RequestsRouteArgs();
}

/// generated route for
/// [ManagerDashboardPage]
class ManagerDashboardRoute extends PageRouteInfo<ManagerDashboardRouteArgs> {
  ManagerDashboardRoute({
   required ManagerDashboardRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    ManagerDashboardRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'ManagerDashboardRoute';

  static const PageInfo<ManagerDashboardRouteArgs> page =
  PageInfo<ManagerDashboardRouteArgs>(name);
}
class ManagerDashboardRouteArgs {
  const ManagerDashboardRouteArgs( );
   static ManagerDashboardRouteArgs noArgs()=>ManagerDashboardRouteArgs();
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
   required ProfileRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    ProfileRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
  PageInfo<ProfileRouteArgs>(name);
}
class ProfileRouteArgs {
  const ProfileRouteArgs( );
   static ProfileRouteArgs noArgs()=>ProfileRouteArgs();
}

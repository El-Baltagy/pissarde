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
    RotateBranchQrRoute.name: (routeData) {
      final args = routeData.argsAs<RotateBranchQrRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: RotateBranchQrPage(
           args: args ,
        )),
      );
    },
    CheckInForEmployeeRoute.name: (routeData) {
      final args = routeData.argsAs<CheckInForEmployeeRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: CheckInForEmployeePage(
           args: args ,
        )),
      );
    },
    QrBranchValidationRoute.name: (routeData) {
      final args = routeData.argsAs<QrBranchValidationRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: QrBranchValidationPage(
           args: args ,
        )),
      );
    },
    CreateAttendanceCorrectionRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAttendanceCorrectionRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: CreateAttendanceCorrectionPage(
           args: args ,
        )),
      );
    },
    AttendanceCorrectionsRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceCorrectionsRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AttendanceCorrectionsPage(
           args: args ,
        )),
      );
    },
    AttendanceHistoryRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceHistoryRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AttendanceHistoryPage(
           args: args ,
        )),
      );
    },
    AttendanceTodayRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceTodayRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AttendanceTodayPage(
           args: args ,
        )),
      );
    },
    OnBoardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnBoardingRouteArgs>(orElse: () =>   OnBoardingRouteArgs.noArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: OnBoardingPage(
           args: args ,
        )),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      final args = routeData.argsAs<PrivacyPolicyRouteArgs>(orElse: () =>   PrivacyPolicyRouteArgs.noArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: PrivacyPolicyPage(
           args: args ,
        )),
      );
    },
    NotificationsRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationsRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: NotificationsPage(
           args: args ,
        )),
      );
    },
    AddEditEmloyeeRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditEmloyeeRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AddEditEmloyeePage(
           args: args ,
        )),
      );
    },
    AddEditBranchRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditBranchRouteArgs>(orElse: () => AddEditBranchRouteArgs.noArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AddEditBranchPage(
           args: args ,
        )),
      );
    },
    AddEditShiftRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditShiftRouteArgs>(orElse: () =>   AddEditShiftRouteArgs.noArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AddEditShiftPage(
           args: args ,
        )),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ProfilePage(
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
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    EmployeesRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeesRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: EmployeesPage(
              args: args ,
            )),
      );

    },
    ShiftsRoute.name: (routeData) {
      final args = routeData.argsAs<ShiftsRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child:   ShiftsPage(   args: args ,)),
      );
    },
    BranchesRoute.name: (routeData) {
      final args = routeData.argsAs<BranchesRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child:   BranchesPage(   args: args ,)),
      );
    },
    AddLeaveRequestRoute.name: (routeData) {
      final args = routeData.argsAs<AddLeaveRequestRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AddLeaveRequestPage(
           args: args ,
        )),
      );
    },
    PendingApprovalsRoute.name: (routeData) {
      final args = routeData.argsAs<PendingApprovalsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: PendingApprovalsPage(
           args: args ,
        )),
      );
    },
    OfficialHolidaysRoute.name: (routeData) {
      final args = routeData.argsAs<OfficialHolidaysRouteArgs>( );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child:   OfficialHolidaysPage(   args: args ,)),
      );
    },

  };
}


/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
  const ProfileRouteArgs( this.loginCubit);
  final LoginCubit loginCubit;
}


/// generated route for
/// [EmployeesPage]
class EmployeesRoute extends PageRouteInfo<EmployeesRouteArgs> {
  EmployeesRoute({
    required EmployeesRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    EmployeesRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'EmployeesRoute';

  static const PageInfo<EmployeesRouteArgs> page =
  PageInfo<EmployeesRouteArgs>(name);
}
class EmployeesRouteArgs {
  const EmployeesRouteArgs(this.employeesCubit);
  final EmployeesCubit employeesCubit;
}



/// generated route for
/// [ShiftsPage]
class ShiftsRoute extends PageRouteInfo<ShiftsRouteArgs> {
  ShiftsRoute({
    required ShiftsRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    ShiftsRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'ShiftsRoute';

  static const PageInfo<ShiftsRouteArgs> page =
  PageInfo<ShiftsRouteArgs>(name);
}
class ShiftsRouteArgs {
  const ShiftsRouteArgs(this.shiftsCubit);
  final ShiftsCubit shiftsCubit;
}
/// generated route for
/// [BranchesPage]
class BranchesRoute extends PageRouteInfo<BranchesRouteArgs> {
  BranchesRoute({
    required BranchesRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    BranchesRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'BranchesRoute';

  static const PageInfo<BranchesRouteArgs> page =
  PageInfo<BranchesRouteArgs>(name);
}
class BranchesRouteArgs {
  const BranchesRouteArgs(this.branchesCubit);
  final BranchesCubit branchesCubit;
}


/// generated route for
/// [OfficialHolidaysPage]
class OfficialHolidaysRoute extends PageRouteInfo<OfficialHolidaysRouteArgs> {
  OfficialHolidaysRoute({
    required OfficialHolidaysRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    OfficialHolidaysRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'OfficialHolidaysRoute';

  static const PageInfo<OfficialHolidaysRouteArgs> page =
  PageInfo<OfficialHolidaysRouteArgs>(name);
}
class OfficialHolidaysRouteArgs {
  const OfficialHolidaysRouteArgs( this.profileCubit);
  final ProfileCubit profileCubit;
}



/// generated route for
/// [AddEditShiftPage]
class AddEditShiftRoute extends PageRouteInfo<AddEditShiftRouteArgs> {
  AddEditShiftRoute({
   required AddEditShiftRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    AddEditShiftRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'AddEditShiftRoute';

  static const PageInfo<AddEditShiftRouteArgs> page =
  PageInfo<AddEditShiftRouteArgs>(name);
}
class AddEditShiftRouteArgs {
  const AddEditShiftRouteArgs({this.shiftsCubit, this.shiftItem});
  final ShiftsCubit? shiftsCubit;
  final ShiftItem? shiftItem;
  static AddEditShiftRouteArgs noArgs() => const AddEditShiftRouteArgs();
}

/// generated route for
/// [AddEditBranchPage]
class AddEditBranchRoute extends PageRouteInfo<AddEditBranchRouteArgs> {
  AddEditBranchRoute({
   required AddEditBranchRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    AddEditBranchRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'AddEditBranchRoute';

  static const PageInfo<AddEditBranchRouteArgs> page =
  PageInfo<AddEditBranchRouteArgs>(name);
}
class AddEditBranchRouteArgs {
  const AddEditBranchRouteArgs({this.branchesCubit, this.branchItem});
  final BranchesCubit? branchesCubit;
  final DataItem? branchItem;
  static AddEditBranchRouteArgs noArgs() => const AddEditBranchRouteArgs();
}

/// generated route for
/// [AddEditEmloyeePage]
class AddEditEmloyeeRoute extends PageRouteInfo<AddEditEmloyeeRouteArgs> {
  AddEditEmloyeeRoute({
   required AddEditEmloyeeRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    AddEditEmloyeeRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'AddEditEmloyeeRoute';

  static const PageInfo<AddEditEmloyeeRouteArgs> page =
  PageInfo<AddEditEmloyeeRouteArgs>(name);
}
class AddEditEmloyeeRouteArgs {
  const AddEditEmloyeeRouteArgs({required this.employeesCubit, this.employeeItem});
  final EmployeesCubit  employeesCubit;
  final emp.DataItem? employeeItem;
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<NotificationsRouteArgs> {
  NotificationsRoute({
   required NotificationsRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    NotificationsRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'NotificationsRoute';

  static const PageInfo<NotificationsRouteArgs> page =
  PageInfo<NotificationsRouteArgs>(name);
}
class NotificationsRouteArgs {
  const NotificationsRouteArgs(this.notificationsCubit );
  final NotificationsCubit notificationsCubit;
}


/// generated route for
/// [AddLeaveRequestPage]
class AddLeaveRequestRoute extends PageRouteInfo<AddLeaveRequestRouteArgs> {
  AddLeaveRequestRoute({
    required AddLeaveRequestRouteArgs args,
    List<PageRouteInfo>? children,
  }) : super(
    AddLeaveRequestRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'AddLeaveRequestRoute';

  static const PageInfo<AddLeaveRequestRouteArgs> page =
  PageInfo<AddLeaveRequestRouteArgs>(name);
}
class AddLeaveRequestRouteArgs {
  const AddLeaveRequestRouteArgs({required this.requestsCubit, required this.leaveTypes});
  final RequestsCubit requestsCubit;
  final List<LeaveTypeItem> leaveTypes;
}

/// generated route for
/// [PendingApprovalsPage]
class PendingApprovalsRoute extends PageRouteInfo<PendingApprovalsRouteArgs> {
  PendingApprovalsRoute({
    required PendingApprovalsRouteArgs args,
    List<PageRouteInfo>? children,
  }) : super(
    PendingApprovalsRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'PendingApprovalsRoute';

  static const PageInfo<PendingApprovalsRouteArgs> page =
  PageInfo<PendingApprovalsRouteArgs>(name);
}
class PendingApprovalsRouteArgs {
  const PendingApprovalsRouteArgs({required this.requestsCubit});
  final RequestsCubit requestsCubit;
}

/// generated route for
/// [PrivacyPolicyPage]
class PrivacyPolicyRoute extends PageRouteInfo<PrivacyPolicyRouteArgs> {
  PrivacyPolicyRoute({
   required PrivacyPolicyRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    PrivacyPolicyRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<PrivacyPolicyRouteArgs> page =
  PageInfo<PrivacyPolicyRouteArgs>(name);
}
class PrivacyPolicyRouteArgs {
  const PrivacyPolicyRouteArgs( );
   static PrivacyPolicyRouteArgs noArgs()=>PrivacyPolicyRouteArgs();
}

/// generated route for
/// [OnBoardingPage]
class OnBoardingRoute extends PageRouteInfo<OnBoardingRouteArgs> {
  OnBoardingRoute({
   required OnBoardingRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    OnBoardingRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'OnBoardingRoute';

  static const PageInfo<OnBoardingRouteArgs> page =
  PageInfo<OnBoardingRouteArgs>(name);
}
class OnBoardingRouteArgs {
  const OnBoardingRouteArgs( );
   static OnBoardingRouteArgs noArgs()=>OnBoardingRouteArgs();
}

/// generated route for
/// [AttendanceTodayPage]
class AttendanceTodayRoute extends PageRouteInfo<AttendanceTodayRouteArgs> {
  AttendanceTodayRoute({
   required AttendanceTodayRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    AttendanceTodayRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'AttendanceTodayRoute';

  static const PageInfo<AttendanceTodayRouteArgs> page =
  PageInfo<AttendanceTodayRouteArgs>(name);
}
class AttendanceTodayRouteArgs {
  const AttendanceTodayRouteArgs(this.homeCubit );
  final HomeCubit homeCubit;
}

/// generated route for
/// [AttendanceHistoryPage]
class AttendanceHistoryRoute extends PageRouteInfo<AttendanceHistoryRouteArgs> {
  AttendanceHistoryRoute({
   required AttendanceHistoryRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    AttendanceHistoryRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'AttendanceHistoryRoute';

  static const PageInfo<AttendanceHistoryRouteArgs> page =
  PageInfo<AttendanceHistoryRouteArgs>(name);
}
class AttendanceHistoryRouteArgs {
  const AttendanceHistoryRouteArgs(this.homeCubit );
  final HomeCubit homeCubit;
}

/// generated route for
/// [AttendanceCorrectionsPage]
class AttendanceCorrectionsRoute extends PageRouteInfo<AttendanceCorrectionsRouteArgs> {
  AttendanceCorrectionsRoute({
   required AttendanceCorrectionsRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    AttendanceCorrectionsRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'AttendanceCorrectionsRoute';

  static const PageInfo<AttendanceCorrectionsRouteArgs> page =
  PageInfo<AttendanceCorrectionsRouteArgs>(name);
}
class AttendanceCorrectionsRouteArgs {
  const AttendanceCorrectionsRouteArgs(this.homeCubit );
  final HomeCubit homeCubit;
}

/// generated route for
/// [CreateAttendanceCorrectionPage]
class CreateAttendanceCorrectionRoute extends PageRouteInfo<CreateAttendanceCorrectionRouteArgs> {
  CreateAttendanceCorrectionRoute({
   required CreateAttendanceCorrectionRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    CreateAttendanceCorrectionRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'CreateAttendanceCorrectionRoute';

  static const PageInfo<CreateAttendanceCorrectionRouteArgs> page =
  PageInfo<CreateAttendanceCorrectionRouteArgs>(name);
}
class CreateAttendanceCorrectionRouteArgs {
  const CreateAttendanceCorrectionRouteArgs(this.homeCubit );
  final HomeCubit homeCubit;
}

/// generated route for
/// [QrBranchValidationPage]
class QrBranchValidationRoute extends PageRouteInfo<QrBranchValidationRouteArgs> {
  QrBranchValidationRoute({
   required QrBranchValidationRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    QrBranchValidationRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'QrBranchValidationRoute';

  static const PageInfo<QrBranchValidationRouteArgs> page =
  PageInfo<QrBranchValidationRouteArgs>(name);
}
class QrBranchValidationRouteArgs {
  const QrBranchValidationRouteArgs(this.homeCubit );
  final HomeCubit homeCubit;
}

/// generated route for
/// [CheckInForEmployeePage]
class CheckInForEmployeeRoute extends PageRouteInfo<CheckInForEmployeeRouteArgs> {
  CheckInForEmployeeRoute({
   required CheckInForEmployeeRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    CheckInForEmployeeRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'CheckInForEmployeeRoute';

  static const PageInfo<CheckInForEmployeeRouteArgs> page =
  PageInfo<CheckInForEmployeeRouteArgs>(name);
}
class CheckInForEmployeeRouteArgs {
  const CheckInForEmployeeRouteArgs(this.homeCubit );
  final HomeCubit homeCubit;
}

/// generated route for
/// [RotateBranchQrPage]
class RotateBranchQrRoute extends PageRouteInfo<RotateBranchQrRouteArgs> {
  RotateBranchQrRoute({
   required RotateBranchQrRouteArgs args  ,
    List<PageRouteInfo>? children,
  }) : super(
    RotateBranchQrRoute.name,
    args: args,
    initialChildren: children,
  );

  static const String name = 'RotateBranchQrRoute';

  static const PageInfo<RotateBranchQrRouteArgs> page =
  PageInfo<RotateBranchQrRouteArgs>(name);
}
class RotateBranchQrRouteArgs {
  const RotateBranchQrRouteArgs(this.homeCubit);
  final HomeCubit homeCubit;
}

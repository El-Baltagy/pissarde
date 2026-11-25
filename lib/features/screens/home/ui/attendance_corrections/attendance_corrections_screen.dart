import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';

part 'attendance_corrections_base_state.dart';

@RoutePage()
class AttendanceCorrectionsPage extends StatefulWidget
    implements AutoRouteWrapper {
  const AttendanceCorrectionsPage({super.key, required this.args});
  final AttendanceCorrectionsRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.homeCubit,
      child: this,
    );
  }

  @override
  State<AttendanceCorrectionsPage> createState() =>
      _AttendanceCorrectionsPageState();
}

class _AttendanceCorrectionsPageState
    extends AttendanceCorrectionsPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          title: Text(
            'list_attendance_corrections'.tr(),
            style: AppTextStyles.font18SemiBold,
          ),
        ),
        body: Semantics(
          label: 'List Attendance Corrections Screen',
          child: Center(
            child: Text(
              'list_attendance_corrections'.tr(),
              style: AppTextStyles.font16SemiBold.copyWith(
                color: AppColors.lightTextSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

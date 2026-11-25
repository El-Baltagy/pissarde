import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/ui/attendance_today/widgets/attendance_today_body_widget.dart';

part 'attendance_today_base_state.dart';

@RoutePage()
class AttendanceTodayPage extends StatefulWidget implements AutoRouteWrapper {
  const AttendanceTodayPage({super.key, required this.args});
  final AttendanceTodayRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.homeCubit,
    child: this,
    );
  }

  @override
  State<AttendanceTodayPage> createState() => _AttendanceTodayPageState();
}

class _AttendanceTodayPageState extends AttendanceTodayPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: CustomAppBar(
          title: 'attendance_today'.tr(),
        ),
        body: Semantics(
          label: 'Attendance Today Screen',
          child: BlocSelector<HomeCubit, HomeState, BaseEmit?>(
            selector: (state) =>
                state is HomeLoaded ? state.attendanceTodayState : null,
            builder: (context, emit) {
              return AttendanceTodayBodyWidget(
                emit: emit,
                onRefresh: onRefresh,
              );
            },
          ),
        ),
      ),
    );
  }
}

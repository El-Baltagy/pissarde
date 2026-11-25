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
import 'package:newf/features/screens/home/data/model/attendance_history_req_param.dart';
import 'package:newf/features/screens/home/ui/attendance_history/widgets/attendance_history_list_widget.dart';
import 'package:newf/features/screens/home/ui/attendance_history/widgets/attendance_history_month_filter_widget.dart';

part 'attendance_history_base_state.dart';

@RoutePage()
class AttendanceHistoryPage extends StatefulWidget implements AutoRouteWrapper {
  const AttendanceHistoryPage({super.key, required this.args});
  final AttendanceHistoryRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => AppLocator()()(),
      child: this,
    );
  }

  @override
  State<AttendanceHistoryPage> createState() => _AttendanceHistoryPageState();
}

class _AttendanceHistoryPageState extends AttendanceHistoryPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: CustomAppBar(
          title: 'attendance_history'.tr(),
        ),
        body: Semantics(
          label: 'Attendance History Screen',
          child: Column(
            children: [
              AttendanceHistoryMonthFilterWidget(
                selectedMonth: selectedMonth,
                onPreviousMonth: onPreviousMonth,
                onNextMonth: onNextMonth,
              ),
              Expanded(
                child: BlocSelector<HomeCubit, HomeState, BaseEmit?>(
                  selector: (state) =>
                      state is HomeLoaded ? state.attendanceHistoryState : null,
                  builder: (context, emit) {
                    return AttendanceHistoryListWidget(
                      emit: emit,
                      onRefresh: onRefresh,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/attendance_record/controller/attendance_record_cubit.dart';
import 'package:newf/features/screens/attendance_record/ui/attendance_record/widgets/attendance_record_content_widget.dart';

part 'attendance_record_base_state.dart';

@RoutePage()
class AttendanceRecordPage extends StatefulWidget implements AutoRouteWrapper {
  const AttendanceRecordPage({super.key, required this.args});
  final AttendanceRecordRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AttendanceRecordCubit>(
      create: (context) => AppLocator()()(),
      child: this,
    );
  }

  @override
  State<AttendanceRecordPage> createState() => _AttendanceRecordPageState();
}

class _AttendanceRecordPageState extends AttendanceRecordPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AttendanceRecordCubit, AttendanceRecordState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          title: Text(
            'nav_attendance_record'.tr(),
            style: AppTextStyles.font18Bold.copyWith(
              color: AppColors.roleSwitchSelectedBg,
            ),
          ),
          backgroundColor: AppColors.headerBackground,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Semantics(
                label: 'Attendance History and Records List',
                child: const AttendanceRecordContentWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

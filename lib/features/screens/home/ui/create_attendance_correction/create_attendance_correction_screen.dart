import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';

part 'create_attendance_correction_base_state.dart';

@RoutePage()
class CreateAttendanceCorrectionPage extends StatefulWidget
    implements AutoRouteWrapper {
  const CreateAttendanceCorrectionPage({super.key, required this.args});
  final CreateAttendanceCorrectionRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.homeCubit,
      child: this,
    );
  }

  @override
  State<CreateAttendanceCorrectionPage> createState() =>
      _CreateAttendanceCorrectionPageState();
}

class _CreateAttendanceCorrectionPageState
    extends CreateAttendanceCorrectionPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          title: Text(
            'create_attendance_correction'.tr(),
            style: AppTextStyles.font18SemiBold,
          ),
        ),
        body: Semantics(
          label: 'Create Attendance Correction Screen',
          child: Center(
            child: Text(
              'create_attendance_correction'.tr(),
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

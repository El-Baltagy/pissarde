import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/data/model/create_attendance_correction_req_param.dart';
import 'package:newf/features/screens/home/ui/create_attendance_correction/widgets/correction_date_time_card_widget.dart';
import 'package:newf/features/screens/home/ui/create_attendance_correction/widgets/correction_header_card_widget.dart';
import 'package:newf/features/screens/home/ui/create_attendance_correction/widgets/correction_reason_input_widget.dart';
import 'package:newf/features/screens/home/ui/create_attendance_correction/widgets/correction_submit_button_widget.dart';

part 'create_attendance_correction_base_state.dart';

@RoutePage()
class CreateAttendanceCorrectionPage extends StatefulWidget
    implements AutoRouteWrapper {
  const CreateAttendanceCorrectionPage({super.key, required this.args});
  final CreateAttendanceCorrectionRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => AppLocator()()(),
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
      listener: _listener,
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          backgroundColor: context.theme.primaryColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.roleSwitchSelectedBg),
          title: Text(
            'create_attendance_correction'.tr(),
            style: AppTextStyles.font18Bold
                .copyWith(color: AppColors.roleSwitchSelectedBg),
          ),
        ),
        body: Semantics(
          label: 'Create attendance correction form',
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSizes.s16,
                children: [
                  const CorrectionHeaderCardWidget(),
                  CorrectionDateTimeCardWidget(
                    controllerDate: controllerDate,
                    controllerCheckIn: controllerCheckIn,
                    controllerCheckOut: controllerCheckOut,
                    onPickDate: () => _pickDate(context),
                    onPickCheckIn: () => _pickTime(context, controllerCheckIn),
                    onPickCheckOut: () => _pickTime(
                      context,
                      controllerCheckOut,
                      isCheckOut: true,
                    ),
                  ),
                  CorrectionReasonInputWidget(
                    controllerReason: controllerReason,
                  ),
                  CorrectionSubmitButtonWidget(onSubmit: _submit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

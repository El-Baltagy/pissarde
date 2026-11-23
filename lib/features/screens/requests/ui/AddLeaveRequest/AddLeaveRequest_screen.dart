import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/requests/controller/requests_cubit.dart';
import 'package:newf/features/screens/requests/data/model/create_leave_request_req_param.dart';
import 'package:newf/features/screens/requests/ui/AddLeaveRequest/widgets/add_leave_header_card_widget.dart';
import 'package:newf/features/screens/requests/ui/AddLeaveRequest/widgets/add_leave_submit_button_widget.dart';
import 'package:newf/features/screens/requests/ui/AddLeaveRequest/widgets/leave_date_picker_widget.dart';
import 'package:newf/features/screens/requests/ui/AddLeaveRequest/widgets/leave_details_input_widget.dart';
import 'package:newf/features/screens/requests/ui/AddLeaveRequest/widgets/leave_type_dropdown_widget.dart';

part 'AddLeaveRequest_base_state.dart';

@RoutePage()
class AddLeaveRequestPage extends StatefulWidget implements AutoRouteWrapper {
  const AddLeaveRequestPage({super.key, required this.args});
  final AddLeaveRequestRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.requestsCubit, child: this);
  }

  @override
  State<AddLeaveRequestPage> createState() => _AddLeaveRequestPageState();
}

class _AddLeaveRequestPageState extends AddLeaveRequestPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestsCubit, RequestsState>(
      listener: _listener,
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          backgroundColor: context.theme.primaryColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.roleSwitchSelectedBg),
          title: Text(
            'new_leave_request'.tr(),
            style: AppTextStyles.font18Bold
                .copyWith(color: AppColors.roleSwitchSelectedBg),
          ),
        ),
        body: Semantics(
          label: 'Add leave request form',
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSizes.s16,
                children: [
                  const AddLeaveHeaderCardWidget(),
                  LeaveTypeDropdownWidget(
                    leaveTypes: widget.args.leaveTypes,
                    selectedLeaveTypeId: selectedLeaveTypeId,
                    onChanged: (val) => setState(() => selectedLeaveTypeId = val),
                  ),
                  LeaveDatePickerWidget(
                    controllerStartDate: controllerStartDate,
                    controllerEndDate: controllerEndDate,
                    onPickStartDate: () => _pickDate(context, controllerStartDate),
                    onPickEndDate: () =>
                        _pickDate(context, controllerEndDate, isEnd: true),
                  ),
                  LeaveDetailsInputWidget(
                    controllerReason: controllerReason,
                    controllerEmergencyPhone: controllerEmergencyPhone,
                  ),
                  AddLeaveSubmitButtonWidget(
                    onSubmit: _submit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

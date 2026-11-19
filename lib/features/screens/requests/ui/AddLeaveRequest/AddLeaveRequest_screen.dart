import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/requests/controller/requests_cubit.dart';
import 'package:newf/features/screens/requests/data/model/create_leave_request_req_param.dart';

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
      child: Semantics(
        label: 'Add Leave Request Screen',
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: CustomAppBar(title: 'new_leave_request'.tr()),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Leave type dropdown
                  Text(
                    'leave_type'.tr(),
                    style: AppTextStyles.font14Regular.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  AppSizes.s10.verticalSpace,
                  DropdownButtonFormField<int>(
                    initialValue: selectedLeaveTypeId,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSizes.r10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p16,
                        vertical: AppPadding.p12,
                      ),
                    ),
                    hint: Text('leave_type'.tr()),
                    items: widget.args.leaveTypes
                        .map(
                          (t) => DropdownMenuItem(
                            value: t.id,
                            child: Text(t.name),
                          ),
                        )
                        .toList(),
                    onChanged: (val) => setState(() => selectedLeaveTypeId = val),
                    validator: (val) =>
                        val == null ? 'leave_type_required'.tr() : null,
                  ),
                  AppSizes.s20.verticalSpace,
                  // Start date
                  _buildDateField(
                    title: 'start_date'.tr(),
                    controller: controllerStartDate,
                    onTap: () => _pickDate(context, controllerStartDate),
                    validator: (val) =>
                        (val == null || val.isEmpty) ? 'start_date_required'.tr() : null,
                  ),
                  AppSizes.s20.verticalSpace,
                  // End date
                  _buildDateField(
                    title: 'end_date'.tr(),
                    controller: controllerEndDate,
                    onTap: () => _pickDate(context, controllerEndDate, isEnd: true),
                    validator: (val) =>
                        (val == null || val.isEmpty) ? 'end_date_required'.tr() : null,
                  ),
                  AppSizes.s20.verticalSpace,
                  // Reason
                  Text(
                    'reason'.tr(),
                    style: AppTextStyles.font14Regular.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  AppSizes.s10.verticalSpace,
                  TextFormField(
                    controller: controllerReason,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'reason'.tr(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSizes.r10),
                      ),
                      contentPadding: const EdgeInsets.all(AppPadding.p12),
                    ),
                    validator: (val) =>
                        (val == null || val.isEmpty) ? 'reason_required'.tr() : null,
                  ),
                  AppSizes.s20.verticalSpace,
                  // Emergency phone
                  Text(
                    'emergency_phone'.tr(),
                    style: AppTextStyles.font14Regular.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  AppSizes.s10.verticalSpace,
                  TextFormField(
                    controller: controllerEmergencyPhone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'emergency_phone'.tr(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSizes.r10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p16,
                        vertical: AppPadding.p12,
                      ),
                    ),
                    validator: (val) =>
                        (val == null || val.isEmpty) ? 'emergency_phone_required'.tr() : null,
                  ),
                  AppSizes.s32.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    height: AppSizes.s48,
                    child: BlocBuilder<RequestsCubit, RequestsState>(
                      builder: (context, state) {
                        final isLoading = state is RequestsLoaded &&
                            state.createLeaveRequestState is Loading;
                        return ElevatedButton(
                          onPressed: () => _submit(isLoading),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSizes.s8),
                            ),
                          ),
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: context.theme.scaffoldBackgroundColor,
                                )
                              : Text(
                                  'add'.tr(),
                                  style: AppTextStyles.font16SemiBold.copyWith(
                                    color: context.theme.scaffoldBackgroundColor,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                  AppSizes.s20.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField({
    required String title,
    required TextEditingController controller,
    required VoidCallback onTap,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.font14Regular.copyWith(
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        AppSizes.s10.verticalSpace,
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: 'YYYY-MM-DD',
            suffixIcon: const Icon(Icons.calendar_month_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r10),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16,
              vertical: AppPadding.p12,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}

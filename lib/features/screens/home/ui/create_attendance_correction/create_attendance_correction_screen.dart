import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/data/model/attendance_correction_request_res/attendance_correction_request_res.dart';
import 'package:newf/features/screens/home/data/model/create_attendance_correction_req_param.dart';

part 'create_attendance_correction_base_state.dart';

@RoutePage()
class CreateAttendanceCorrectionPage extends StatefulWidget
    implements AutoRouteWrapper {
  const CreateAttendanceCorrectionPage({super.key, required this.args});
  final CreateAttendanceCorrectionRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.homeCubit, child: this);
  }

  @override
  State<CreateAttendanceCorrectionPage> createState() =>
      _CreateAttendanceCorrectionPageState();
}

class _CreateAttendanceCorrectionPageState
    extends CreateAttendanceCorrectionPageBaseState {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _checkInController = TextEditingController();
  final _checkOutController = TextEditingController();
  final _reasonController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _checkInController.dispose();
    _checkOutController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _submit(bool isLoading) async {
    if (isLoading) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;

    await homeCubit.createAttendanceCorrectionFunc(
      Init(),
      parameter: CreateAttendanceCorrectionReqParam(
        date: _dateController.text.trim(),
        requested_check_in_at: _checkInController.text.trim(),
        requested_check_out_at: _checkOutController.text.trim(),
        reason: _reasonController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded) {
          if (state.createAttendanceCorrectionState is Success) {
            final res =
                (state.createAttendanceCorrectionState as Success).data;
            final msg = res is AttendanceCorrectionRequestRes
                ? res.message
                : 'attendance_correction_created'.tr();
            context.showToast(msg);
            context.pop(true);
          } else if (state.createAttendanceCorrectionState is ErrorState) {
            final err = state.createAttendanceCorrectionState as ErrorState;
            context.showToast(err.failure.message, isSuccess: false);
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: CustomAppBar(title: 'create_attendance_correction'.tr()),
        body: Semantics(
          label: 'Create attendance correction',
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: AppSizes.s16,
                children: [
                  _Field(
                    controller: _dateController,
                    label: 'date'.tr(),
                    hint: 'YYYY-MM-DD',
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'required'.tr() : null,
                  ),
                  _Field(
                    controller: _checkInController,
                    label: 'requested_check_in'.tr(),
                    hint: 'HH:mm',
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'required'.tr() : null,
                  ),
                  _Field(
                    controller: _checkOutController,
                    label: 'requested_check_out'.tr(),
                    hint: 'HH:mm',
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'required'.tr() : null,
                  ),
                  _Field(
                    controller: _reasonController,
                    label: 'reason'.tr(),
                    maxLines: 3,
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'required'.tr() : null,
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final isLoading = state is HomeLoaded &&
                          state.createAttendanceCorrectionState is Loading;
                      return SizedBox(
                        width: double.infinity,
                        height: AppSizes.s48,
                        child: ElevatedButton(
                          onPressed: () => _submit(isLoading),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSizes.s8),
                            ),
                          ),
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color:
                                      context.theme.scaffoldBackgroundColor,
                                )
                              : Text(
                                  'submit'.tr(),
                                  style: AppTextStyles.font16SemiBold
                                      .copyWith(
                                    color:
                                        context.theme.scaffoldBackgroundColor,
                                  ),
                                ),
                        ),
                      );
                    },
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

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.label,
    this.hint,
    this.maxLines = 1,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final int maxLines;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizes.s6,
      children: [
        Text(
          label,
          style: AppTextStyles.font14Regular.copyWith(
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
              vertical: AppPadding.p10,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/data/model/shifts/1-create_shift_req_param.dart';

/// Bottom sheet form for adding a new shift.
class AddShiftBottomSheet extends StatefulWidget {
  const AddShiftBottomSheet({super.key});

  @override
  State<AddShiftBottomSheet> createState() => _AddShiftBottomSheetState();
}

class _AddShiftBottomSheetState extends State<AddShiftBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _codeCtrl = TextEditingController();
  final _startCtrl = TextEditingController();
  final _endCtrl = TextEditingController();
  final _graceCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _codeCtrl.dispose();
    _startCtrl.dispose();
    _endCtrl.dispose();
    _graceCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final param = CreateShiftReqParam(
      name: _nameCtrl.text.trim(),
      code: _codeCtrl.text.trim(),
      start_time: _startCtrl.text.trim(),
      end_time: _endCtrl.text.trim(),
      is_overnight: '0',
      grace_period_minutes:
          _graceCtrl.text.trim().isEmpty ? '5' : _graceCtrl.text.trim(),
      checkin_window_start_minutes: '30',
      checkin_window_end_minutes: '30',
      break_duration_minutes: '60',
      working_days: [1, 2, 3, 4, 5],
      is_active: '1',
    );
    // context.read<ProfileCubit>().createShiftFunc(param);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Add shift form',
      child: Container(
        padding: EdgeInsets.only(
          left: AppPadding.p16,
          right: AppPadding.p16,
          top: AppPadding.p20,
          bottom:
              MediaQuery.of(context).viewInsets.bottom + AppPadding.p20,
        ),
        decoration: const BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSizes.r20)),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AppSizes.s12,
              children: [
                Center(
                  child: Container(
                    width: AppSizes.s40,
                    height: AppSizes.s4,
                    decoration: BoxDecoration(
                      color: AppColors.cardBorder,
                      borderRadius: BorderRadius.circular(AppSizes.r4),
                    ),
                  ),
                ),
                Text(
                  'add_shift'.tr(),
                  style: AppTextStyles.font18Bold,
                  textAlign: TextAlign.center,
                ),
                _buildField('shift_name'.tr(), _nameCtrl),
                _buildField('shift_code'.tr(), _codeCtrl),
                _buildField('start_time'.tr(), _startCtrl,
                    hint: 'HH:MM'),
                _buildField('end_time'.tr(), _endCtrl, hint: 'HH:MM'),
                _buildField('grace_period_minutes'.tr(), _graceCtrl,
                    keyboardType: TextInputType.number, required: false),
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.headerBackground,
                    padding: const EdgeInsets.symmetric(
                        vertical: AppPadding.p14),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSizes.r12)),
                  ),
                  child: Text(
                    'save'.tr(),
                    style: AppTextStyles.font16Bold.copyWith(
                        color: AppColors.roleSwitchSelectedBg),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController ctrl, {
    TextInputType? keyboardType,
    String? hint,
    bool required = true,
  }) {
    return TextFormField(
      controller: ctrl,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: AppTextStyles.font13Regular,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.r10)),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
      ),
      validator: required
          ? (v) =>
              (v == null || v.isEmpty) ? 'field_required'.tr() : null
          : null,
    );
  }
}

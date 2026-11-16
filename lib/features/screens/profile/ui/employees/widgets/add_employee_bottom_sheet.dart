import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/data/model/employees/1-create_employee_req_param.dart';

/// Bottom sheet form for adding a new employee.
class AddEmployeeBottomSheet extends StatefulWidget {
  const AddEmployeeBottomSheet({super.key});

  @override
  State<AddEmployeeBottomSheet> createState() =>
      _AddEmployeeBottomSheetState();
}

class _AddEmployeeBottomSheetState extends State<AddEmployeeBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _codeCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _codeCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final param = CreateEmployeeReqParam(
      name: _nameCtrl.text.trim(),
      email: _emailCtrl.text.trim(),
      password: _passwordCtrl.text.trim(),
      employee_code: _codeCtrl.text.trim(),
      phone: _phoneCtrl.text.trim(),
      role: 'employee',
      employee_type: 'full_time',
      work_type: 'office',
      branch_id: '1',
      supervisor_id: '1',
      shift_id: '1',
      is_active: '1',
    );
    context.read<ProfileCubit>().createEmployeeFunc(param);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Add employee form',
      child: Container(
        padding: EdgeInsets.only(
          left: AppPadding.p16,
          right: AppPadding.p16,
          top: AppPadding.p20,
          bottom: MediaQuery.of(context).viewInsets.bottom + AppPadding.p20,
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
                      borderRadius:
                          BorderRadius.circular(AppSizes.r4),
                    ),
                  ),
                ),
                Text(
                  'add_employee'.tr(),
                  style: AppTextStyles.font18Bold,
                  textAlign: TextAlign.center,
                ),
                _buildField('employee_name'.tr(), _nameCtrl),
                _buildField('email'.tr(), _emailCtrl,
                    keyboardType: TextInputType.emailAddress),
                _buildField('password'.tr(), _passwordCtrl,
                    obscure: true),
                _buildField('employee_code'.tr(), _codeCtrl),
                _buildField('phone'.tr(), _phoneCtrl,
                    keyboardType: TextInputType.phone),
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
    bool obscure = false,
  }) {
    return TextFormField(
      controller: ctrl,
      keyboardType: keyboardType,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.font13Regular,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.r10)),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
      ),
      validator: (v) =>
          (v == null || v.isEmpty) ? 'field_required'.tr() : null,
    );
  }
}

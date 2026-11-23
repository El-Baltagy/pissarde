import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/branches/controller/branches_cubit.dart';
import 'package:newf/features/screens/branches/data/model/branches/1-create_branch_req_param.dart';
import 'package:newf/core/extension/context.dart';

/// Bottom sheet form for adding a new branch.
class AddBranchBottomSheet extends StatefulWidget {
  const AddBranchBottomSheet({super.key});

  @override
  State<AddBranchBottomSheet> createState() =>
      _AddBranchBottomSheetState();
}

class _AddBranchBottomSheetState extends State<AddBranchBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _codeCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _latCtrl = TextEditingController();
  final _lngCtrl = TextEditingController();
  final _radiusCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _codeCtrl.dispose();
    _addressCtrl.dispose();
    _latCtrl.dispose();
    _lngCtrl.dispose();
    _radiusCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final param = CreateBranchReqParam(
      name: _nameCtrl.text.trim(),
      code: _codeCtrl.text.trim(),
      address: _addressCtrl.text.trim(),
      latitude: _latCtrl.text.trim(),
      longitude: _lngCtrl.text.trim(),
      geofence_radius_meters: _radiusCtrl.text.trim().isEmpty
          ? '100'
          : _radiusCtrl.text.trim(),
      is_active: '1',
    );
    // context.read<BranchesCubit>().createBranchFunc(param);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Add branch form',
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
                  'add_branch'.tr(),
                  style: AppTextStyles.font18Bold,
                  textAlign: TextAlign.center,
                ),
                _buildField('branch_name'.tr(), _nameCtrl),
                _buildField('branch_code'.tr(), _codeCtrl),
                _buildField('address'.tr(), _addressCtrl),
                _buildField(
                  'latitude'.tr(),
                  _latCtrl,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true),
                ),
                _buildField(
                  'longitude'.tr(),
                  _lngCtrl,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true),
                ),
                _buildField(
                  'geofence_radius'.tr(),
                  _radiusCtrl,
                  keyboardType: TextInputType.number,
                  required: false,
                ),
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.primaryColor,
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
    bool required = true,
  }) {
    return TextFormField(
      controller: ctrl,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
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

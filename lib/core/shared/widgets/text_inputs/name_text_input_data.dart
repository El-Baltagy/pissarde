import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/shared/widgets/text_inputs/base_text_input_data.dart';

class NameInputData extends BaseTextInputData {
  NameInputData({
    super.controller,
    super.isLabel,
    super.widgetPrefix,
    super.keyboardType,
    super.readOnly,
    super.enabled,
    super.isObscureText,
    super.onTap,
    String? labelText,
    IconData? icon,
    String? Function(String?)? validator,
    super.inputFormatters,
    super.maxLines,
    super.field,
    super.enableValidation,
  }) : super(
          icon: icon ?? Icons.person,
          labelText: labelText ?? 'name'.tr(),
          validator: validator ??
              (value) {
                if (value?.isEmpty == true) {
                  return "can't_be_empty".tr();
                }
                return null;
              },
        );
}

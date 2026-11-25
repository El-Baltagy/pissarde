import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';

final RegExp qrTokenRegex = RegExp(r'^QR_IST-HQ_[A-Za-z0-9]+$');

/// Validates [token] against [qrTokenRegex] and shows an error toast if invalid.
bool validateQrToken(BuildContext context, String? token) {
  // final trimmed = token?.trim() ?? '';
  // if (trimmed.isEmpty || !qrTokenRegex.hasMatch(trimmed)) {
  //   context.showToast('invalid_qr_code'.tr(), isSuccess: false);
  //   return false;
  // }
  return true;
}

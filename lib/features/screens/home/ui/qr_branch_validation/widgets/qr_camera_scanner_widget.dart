import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

/// Full-screen QR code camera scanner that returns the scanned token string.
class QrCameraScannerPage extends StatefulWidget {
  const QrCameraScannerPage({super.key});

  @override
  State<QrCameraScannerPage> createState() => _QrCameraScannerPageState();
}

class _QrCameraScannerPageState extends State<QrCameraScannerPage> {
  final MobileScannerController _controller = MobileScannerController();
  bool _hasScanned = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_hasScanned) return;
    for (final barcode in capture.barcodes) {
      final raw = barcode.rawValue;
      if (raw != null && raw.trim().isNotEmpty) {
        _hasScanned = true;
        Navigator.of(context).pop(raw.trim());
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.roleSwitchSelectedBg),
        title: Text(
          'scan_qr_code'.tr(),
          style: AppTextStyles.font18Bold
              .copyWith(color: AppColors.roleSwitchSelectedBg),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: _onDetect,
          ),
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.roleSwitchSelectedBg,
                width: AppSizes.s2,
              ),
              borderRadius: BorderRadius.circular(AppSizes.r16),
            ),
          ),
        ],
      ),
    );
  }
}

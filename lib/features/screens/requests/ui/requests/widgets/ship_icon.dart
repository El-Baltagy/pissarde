import 'package:flutter/Material.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../core/theming/app_values.dart';

class InfoShip extends StatelessWidget {
  const InfoShip( this.iconData,
      this.txt );
  final IconData iconData;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, size: AppSizes.s12, color: AppColors.contractorGreyText),
        const SizedBox(width: AppSizes.s4),
        Text(txt, style: AppTextStyles.font12Regular),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/shared/widgets/text_inputs/base_text_input_data.dart';
import 'package:newf/core/shared/widgets/text_inputs/text_input_widget.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class TitleWithInputField extends StatelessWidget {
  const TitleWithInputField(this.mainLabel, this.data, {super.key});

  final String mainLabel;
  final BaseTextInputData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              mainLabel,
              style: AppTextStyles.font14Regular.copyWith(
                color: context.theme.colorScheme.onSurface,
              ),
            ),
            if (data.enableValidation && data.field != null) ...[
              const SizedBox(width: AppSizes.s4),
              Text(
                '*',
                style: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.primaryActionRed,
                ),
              ),
            ],
          ],
        ),
        AppSizes.s10.verticalSpace,
        TextInputWidget(data: data),
      ],
    );
  }
}

import 'package:flutter/Material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/shared/widgets/circle_radio.dart';
import 'package:newf/core/shared/widgets/ticker_text.dart';
import 'package:newf/core/theming/app_colors.dart';

class OneItemDropBottomSheetItem extends StatelessWidget {
  const OneItemDropBottomSheetItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.isLastItem,
    required this.isSelected,
    this.subtitle,
    this.style,
    this.subtitleStyle,

    this.isRadio = true,
  });

  final void Function()? onTap;
  final String title;
  final String? subtitle;
  final bool isLastItem, isRadio, isSelected;

  final TextStyle? style;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(1.5),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                crossAxisAlignment: .start,
                children: [
                  Text(title, style: style),
                  Spacer(),
                  CustomSelectedCircleAndSquare(
                    isSelected: isSelected,
                    isRadio: isRadio,
                  ),
                ],
              ),
              if (subtitle != null && subtitle!.isNotEmpty) ...[
                4.verticalSpace,
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    Expanded(
                      child: TickerText(
                        child: Text(
                          subtitle!,
                          style:
                              subtitleStyle ??
                              const TextStyle(
                                fontSize: 12,
                                color: AppColors.lightTextSecondary,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],

              if (!isLastItem)
                Container(
                  height: 0.5,
                  margin: const EdgeInsetsDirectional.fromSTEB(15, 15, 0, 15),
                  color: AppColors.contractorGreyText,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

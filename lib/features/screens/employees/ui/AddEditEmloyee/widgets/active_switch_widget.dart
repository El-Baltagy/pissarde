part of '../AddEditEmloyee_screen.dart';

/// Extracted mini widget: [ActiveSwitchWidget]
class ActiveSwitchWidget extends StatelessWidget {
  const ActiveSwitchWidget({super.key, required this.isActiveNotifier});
final ValueNotifier<bool>   isActiveNotifier  ;
  @override
  Widget build(BuildContext context) {
    return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p12,
                          vertical: AppPadding.p8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(AppSizes.r10),
                          border: Border.all(color: AppColors.cardBorder),
                        ),
                        child: ValueListenableBuilder<bool>(
                          valueListenable: isActiveNotifier,
                          builder: (context, isActive, _) {
                            return SwitchListTile.adaptive(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'active'.tr(),
                                style: AppTextStyles.font14Regular,
                              ),
                              value: isActive,
                              thumbColor: WidgetStateProperty.resolveWith((
                                states,
                              ) {
                                if (states.contains(WidgetState.selected)) {
                                  return context.theme.scaffoldBackgroundColor;
                                }
                                return context.theme.primaryColor;
                              }),
                              onChanged: (val) => isActiveNotifier.value = val,
                            );
                          },
                        ),
                      );
  }
}


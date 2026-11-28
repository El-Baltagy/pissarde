part of '../home_screen.dart';

/// Custom horizontal divider with an animated list/grid view toggle.


class OptionsViewToggleDividerWidget extends StatelessWidget {
  const OptionsViewToggleDividerWidget({
    super.key,
    required this.isGrid,
    required this.onToggle,
  });

  final bool isGrid;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
      ),
      child: Row(
        spacing: AppSizes.s12,
        children: [
          const Expanded(
            flex: 100,
            child: Divider(
              height: AppSizes.s1,
              thickness: AppSizes.s1,
              color: AppColors.cardBorder,
            ),
          ),
          GestureDetector(
            onTap: onToggle,
            child: Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(AppSizes.r16),
                border: Border.all(
                  color: AppColors.cardBorder,
                  width: AppSizes.s1,
                ),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                switchInCurve: Curves.easeOutBack,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: RotationTransition(
                      turns: Tween<double>(
                        begin: 0.15,
                        end: 0,
                      ).animate(animation),
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                  );
                },
                child: Icon(
                  !isGrid
                      ? Icons.view_list_rounded
                      : Icons.grid_view_rounded,
                  key: ValueKey(isGrid),
                  size: AppSizes.s20,
                  color: context.theme.scaffoldBackgroundColor,
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Divider(
              height: AppSizes.s1,
              thickness: AppSizes.s1,
              color: AppColors.cardBorder,
            ),
          ),
        ],
      ),
    );
  }
}



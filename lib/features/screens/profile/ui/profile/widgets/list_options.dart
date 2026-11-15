part of'profile_content_widget.dart';
class ListOptionsWidget extends StatelessWidget {
    ListOptionsWidget({super.key});
  final   _settingsItems = [
    (
    icon: Icons.badge_outlined,
    title: 'job_data'.tr()
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r14),
        border: Border.all(
          color: AppColors.cardBorder,
          width: AppSizes.s1,
        ),
      ),
      child: Column(
        children: _settingsItems
            .map(
              (item) => _buildSettingItem(
              icon: item.icon,
              title: item.title
          ),
        )
            .toList(),
      ),
    );
  }
    Widget _buildSettingItem({
      required IconData icon,
      required String title
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p14,
          vertical: AppPadding.p12,
        ),
        child: Row(
          spacing: AppSizes.s12,
          children: [
            Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                color: AppColors.roleSwitchBg,
                borderRadius: BorderRadius.circular(AppSizes.r10),
              ),
              child: Icon(
                icon,
                color: AppColors.headerBackground,
                size: AppSizes.s20,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSizes.s2,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.font13Medium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            /// LTR side: arrow chevron
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: AppSizes.s14,
              color: AppColors.contractorGreyText,
            ),
          ],
        ),
      );
    }
}

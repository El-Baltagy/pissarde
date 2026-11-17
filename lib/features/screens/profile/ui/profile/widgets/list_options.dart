part of '../profile_screen.dart';

class ListOptionsWidget extends StatelessWidget {
    ListOptionsWidget({super.key, required this.profileCubit});
  ProfileCubit profileCubit;
  @override
  Widget build(BuildContext context) {
    final List<({IconData icon, String title, Future<Object?> Function() onTap})> items = [
      (
        icon: Icons.people_alt_outlined,
        title: 'employees'.tr(),
        onTap: () => context.router.push(  EmployeesRoute(args:EmployeesRouteArgs(profileCubit) )),
      ),
      (
        icon: Icons.schedule_outlined,
        title: 'shifts'.tr(),
        onTap: () => context.router.push(const ShiftsRoute()),
      ),
      (
        icon: Icons.location_city_outlined,
        title: 'branches'.tr(),
        onTap: () => context.router.push(const BranchesRoute()),
      ),
      (
        icon: Icons.celebration_outlined,
        title: 'official_holidays'.tr(),
        onTap: () => context.router.push(const OfficialHolidaysRoute()),
      ),

    ];

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
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Column(
            children: [
              _buildSettingItem(
                icon: item.icon,
                title: item.title,
                onTap: item.onTap,
              ),
              if (index < items.length - 1)
                const Divider(
                  height: AppSizes.s1,
                  thickness: AppSizes.s1,
                  color: AppColors.cardBorder,
                  indent: AppPadding.p16,
                  endIndent: AppPadding.p16,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.r14),
      child: Padding(
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
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: AppSizes.s14,
              color: AppColors.contractorGreyText,
            ),
          ],
        ),
      ),
    );
  }
}

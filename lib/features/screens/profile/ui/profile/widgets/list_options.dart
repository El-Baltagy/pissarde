

part of '../profile_screen.dart';

class ListOptionsWidget extends StatelessWidget {
  const ListOptionsWidget({super.key, required this.profileCubit});
  final ProfileCubit profileCubit;

  @override
  Widget build(BuildContext context) {
    final List<({IconData icon, String title, VoidCallback onTap})> items = [
      if(StorageHelper.isFullMode)
...[
  (
  icon: Icons.people_alt_outlined,
  title: 'employees'.tr(),
  onTap: () => context.router.push(EmployeesRoute(args: EmployeesRouteArgs(AppLocator()()()))),      ),
  (
  icon: Icons.schedule_outlined,
  title: 'shifts'.tr(),
  onTap: () => context.router.push(ShiftsRoute(args: ShiftsRouteArgs(AppLocator()()()))),      ),
  (
  icon: Icons.location_city_outlined,
  title: 'branches'.tr(),
  onTap: () => context.router.push(BranchesRoute(args: BranchesRouteArgs(AppLocator()()()))),      ),
],
      (
        icon: Icons.celebration_outlined,
        title: 'official_holidays'.tr(),
        onTap: () => context.router.push(OfficialHolidaysRoute(args: OfficialHolidaysRouteArgs(profileCubit))),
      ),
      (
        icon: Icons.privacy_tip_outlined,
        title: 'privacy_policy'.tr(),
        onTap: () => context.router.push(PrivacyPolicyRoute(args: PrivacyPolicyRouteArgs())),
      ),
    ];

    return ContainerListWidget(
      items: items
    );
  }


}

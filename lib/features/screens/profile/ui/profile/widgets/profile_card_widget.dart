
part of '../profile_screen.dart';

/// Extracted mini widget: [ProfileCardWidget]
class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if(StorageHelper.userData==null){
      return SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: BorderRadius.circular(AppSizes.r16),
      ),
      /// RTL-first: avatar (right) → text (left)
      child: Row(
        spacing: AppSizes.s14,
        children: [
          Container(
            width: AppSizes.s56,
            height: AppSizes.s56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.headerBadgeBg,
              border: Border.all(
                color: AppColors.roleSwitchSelectedBg,
                width: AppSizes.s2,
              ),
            ),
            child: const Icon(
              Icons.person,
              color: AppColors.roleSwitchSelectedBg,
              size: AppSizes.s32,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSizes.s4,
            children: [
              Text(
                StorageHelper.userData!.name  ,
                style: AppTextStyles.font16Bold.copyWith(
                  color: AppColors.roleSwitchSelectedBg,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}


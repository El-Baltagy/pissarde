import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/branches/controller/branches_cubit.dart';
import 'package:newf/features/screens/branches/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/employees/ui/AddEditEmloyee/widgets/BottomSheetSelector.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Branch selector card styled with [BottomSheetSelector] and [Skeletonizer].
class QrBranchSelectorWidget extends StatelessWidget {
  const QrBranchSelectorWidget({
    super.key,
    required this.selectedNotifier,
  });

  final ValueNotifier<List<int>> selectedNotifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r14),
        border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
      ),
      child: BlocSelector<BranchesCubit, BranchesState, BaseEmit?>(
        selector: (state) =>
            state is BranchesLoaded ? state.getListBranchesState : null,
        builder: (context, branchState) {
          final isLoading = branchState is! Success<BranchesList>;
          final branches = branchState is Success<BranchesList>
              ? branchState.data?.data ?? []
              : <DataItem>[];
          final list = List<UIApiKeys<String>>.generate(
            branches.length,
            (i) => UIApiKeys(branches[i].name, branches[i].id.toString()),
          );

          return Skeletonizer(
            enabled: isLoading,
            child: BottomSheetSelector(
              listChoices: list,
              selectedNotifier: selectedNotifier,
              isMultiSelect: false,
              title: 'branch'.tr(),
            ),
          );
        },
      ),
    );
  }
}

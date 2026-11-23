part of '../AddEditEmloyee_screen.dart';

/// Extracted mini widget: [BranchSelector]
class BranchSelector extends StatelessWidget {
  const BranchSelector({super.key, required this.selectedNotifier, this.field});
  final ValueNotifier<List<int>> selectedNotifier;
  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? field;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<BranchesCubit, BranchesState, BaseEmit?>(
      selector: (state) =>
      state is BranchesLoaded ? state.getListBranchesState : null,
      builder: (context, branchState) {
        final isLoading = branchState is! Success<BranchesList>;
        final branches = branchState is Success<BranchesList>
            ? branchState.data?.data ?? []
            : <DataItemBranch>[];
        List<UIApiKeys<String>> list = .generate(
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
            field: field,
          ),
        );
      },
    );
  }
}


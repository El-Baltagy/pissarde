part of '../AddEditEmloyee_screen.dart';

/// Extracted mini widget: [BranchSelector]
class BranchSelector extends StatelessWidget {
  const BranchSelector({
    super.key,
    required this.selectedNotifier,
    this.field,
    this.preselectId,
  });
  final ValueNotifier<List<int>> selectedNotifier;
  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? field;
  final String? preselectId;

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

        // Auto-select the branch matching [preselectId] once the list loads.
        if (preselectId != null &&
            selectedNotifier.value.isEmpty &&
            branches.isNotEmpty) {
          final idx = branches.indexWhere((b) => b.id.toString() == preselectId);
          if (idx != -1) {
            selectedNotifier.value = [idx];
          }
        }

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


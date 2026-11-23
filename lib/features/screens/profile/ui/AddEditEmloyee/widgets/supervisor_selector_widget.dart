part of '../AddEditEmloyee_screen.dart';

/// Extracted mini widget: [SupervisorSelectorWidget]
class SupervisorSelectorWidget extends StatelessWidget {

  const SupervisorSelectorWidget({super.key, required this.selectedNotifier, this.field});
  final ValueNotifier<List<int>> selectedNotifier;
  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? field;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileCubit, ProfileState, BaseEmit?>(
      selector: (state) =>
      state is ProfileLoaded ? state.getListEmployeesState : null,
      builder: (context, state) {
        final isLoading = state is! Success<GetAllEmployeesRes>;
        final branches = state is Success<GetAllEmployeesRes>
            ? state.data!.data
            :  [];
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

            title: 'supervisor'.tr(),
            field: field,
          ),
        );
      },
    );
  }
}


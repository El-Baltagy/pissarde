part of '../AddEditEmloyee_screen.dart';

/// Extracted mini widget: [ShiftSelectorWidget]
class ShiftSelectorWidget extends StatelessWidget {

  const ShiftSelectorWidget({
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
    return BlocSelector<ShiftsCubit, ShiftsState, BaseEmit?>(
      selector: (state) =>
      state is ShiftsLoaded ? state.getListShiftsState : null,
      builder: (context, state) {
        final isLoading = state is! Success<GetAllShiftsRes>;
        final shifts = state is Success<GetAllShiftsRes>
            ? state.data!.data
            :  [];
        List<UIApiKeys<String>> list = .generate(
          shifts.length,
              (i) => UIApiKeys(shifts[i].name, shifts[i].id.toString()),
        );

        if (preselectId != null &&
            selectedNotifier.value.isEmpty &&
            shifts.isNotEmpty) {
          final idx = shifts.indexWhere((s) => s.id.toString() == preselectId);
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

            title: 'shift'.tr(),
            field: field,
          ),
        );
      },
    );

  }
}


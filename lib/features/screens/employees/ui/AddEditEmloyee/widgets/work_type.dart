part of '../AddEditEmloyee_screen.dart';

/// Extracted mini widget: [WorkTypeSelector]
class WorkTypeSelector extends StatelessWidget {
  const WorkTypeSelector({
    super.key,
    required this.selectedNotifier,
    this.field,
    this.preselectValue,
  });
  final ValueNotifier<List<int>> selectedNotifier;
  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? field;
  final String? preselectValue;

  @override
  Widget build(BuildContext context) {
    List<UIApiKeys<String>> list = [
      UIApiKeys('in_office'.tr(), 'in_office'),
      UIApiKeys('from_home'.tr(), 'Online'),

    ];

    if (preselectValue != null &&
        selectedNotifier.value.isEmpty &&
        list.isNotEmpty) {
      final idx = list.indexWhere((e) => e.apiValue == preselectValue);
      if (idx != -1) {
        selectedNotifier.value = [idx];
      }
    }

    return BottomSheetSelector(
      listChoices: list,
      selectedNotifier: selectedNotifier,
      isMultiSelect: false,

      title: 'work_type'.tr(),
      field: field,
    );
  }
}


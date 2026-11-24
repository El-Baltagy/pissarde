part of '../AddEditEmloyee_screen.dart';

/// Extracted mini widget: [RoleSelector]
class RoleSelector extends StatelessWidget {
  const RoleSelector({
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
      UIApiKeys('admin'.tr(), 'admin'),
      UIApiKeys('hr'.tr(), 'hr'),
      UIApiKeys('supervisor'.tr(), 'supervisor'),
      UIApiKeys('sales_employee'.tr(), 'sales_employee'),
      UIApiKeys('admin_employee'.tr(), 'admin_employee'),
      UIApiKeys('duty_employee'.tr(), 'duty_employee'),

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

      title: 'role'.tr(),
      field: field,
    );
  }
}


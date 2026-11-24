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
  static List<UIApiKeys<String>> list = [
    UIApiKeys('admin'.tr(), 'admin', secUiTxt: 'admin_hint'.tr()),
    UIApiKeys('hr'.tr(), 'hr', secUiTxt: 'hr_hint'.tr()),
    UIApiKeys(
      'supervisor'.tr(),
      'supervisor',
      secUiTxt: 'supervisor_hint'.tr(),
    ),
    UIApiKeys(
      'sales_employee'.tr(),
      'sales_employee',
      secUiTxt: 'sales_employee_hint'.tr(),
    ),
    UIApiKeys(
      'admin_employee'.tr(),
      'admin_employee',
      secUiTxt: 'admin_employee_hint'.tr(),
    ),
    UIApiKeys(
      'duty_employee'.tr(),
      'duty_employee',
      secUiTxt: 'duty_employee_hint'.tr(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
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

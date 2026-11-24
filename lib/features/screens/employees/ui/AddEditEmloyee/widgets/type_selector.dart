part of '../AddEditEmloyee_screen.dart';

/// Extracted mini widget: [TypeSelector]
class TypeSelector extends StatelessWidget {
  const TypeSelector({super.key, required this.selectedNotifier, this.field});
  final ValueNotifier<List<int>> selectedNotifier;
  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? field;
  @override
  Widget build(BuildContext context) {
    List<UIApiKeys<String>> list = [
      UIApiKeys('sales'.tr(), 'sales',secUiTxt: ''.tr()),
      UIApiKeys('administrative'.tr(), 'administrative'),

    ];
    return BottomSheetSelector(
      listChoices: list,
      selectedNotifier: selectedNotifier,
      isMultiSelect: false,

      title: 'employee_type'.tr(),
      field: field,
    );
  }
}

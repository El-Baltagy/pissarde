import 'package:flutter/material.dart';
import 'package:newf/core/shared/methods/date_helper.dart';
import 'package:newf/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/shifts/ui/AddEditShift/widgets/title_with_input.dart';

class StartEndTimesWidget extends StatelessWidget {
  const StartEndTimesWidget({
    super.key,
    this.fieldS,
    this.fieldE,
    required this.controllerS,
    required this.controllerE,
    required this.titleS,
    required this.titleE,
  });

  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? fieldS, fieldE;
  final TextEditingController controllerS, controllerE;
  final String titleS, titleE;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizes.s10,
      children: [
        Expanded(
          child: TitleWithInputField(
            titleS,
            NameInputData(
              isLabel: false,
              readOnly: true,
              field: fieldS,
              labelText: 'HH:MM',
              controller: controllerS,
              widgetPrefix: SizedBox.shrink(),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: _parseTime(controllerS.text) ??
                      const TimeOfDay(hour: 8, minute: 0),
                );
                if (time != null) {
                  controllerS.text =DateTimeHelper.toHourMinute('${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}');
                }
              },
            ),
          ),
        ),
        Expanded(
          child: TitleWithInputField(
            titleE,
            NameInputData(
              isLabel: false,
              readOnly: true,
              field: fieldE,
              labelText: 'HH:MM',
              controller: controllerE,
              widgetPrefix: SizedBox.shrink(),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: _parseTime(controllerE.text) ??
                      const TimeOfDay(hour: 16, minute: 0),
                );
                if (time != null) {
                  controllerE.text =
                  DateTimeHelper.toHourMinute('${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}');
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  TimeOfDay? _parseTime(String val) {
    if (val.isEmpty || !val.contains(':')) return null;
    final parts = val.split(':');
    final h = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    if (h != null && m != null) return TimeOfDay(hour: h, minute: m);
    return null;
  }
}

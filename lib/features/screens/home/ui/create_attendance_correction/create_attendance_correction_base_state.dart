part of 'create_attendance_correction_screen.dart';

abstract class CreateAttendanceCorrectionPageBaseState
    extends State<CreateAttendanceCorrectionPage> {
  late final HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

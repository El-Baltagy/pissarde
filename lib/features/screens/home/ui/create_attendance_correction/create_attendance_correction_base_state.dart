part of 'create_attendance_correction_screen.dart';

abstract class CreateAttendanceCorrectionPageBaseState extends State<CreateAttendanceCorrectionPage> {
  late final HomeCubit homeCubit;

  @override
  void initState() {
    homeCubit = HomeCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

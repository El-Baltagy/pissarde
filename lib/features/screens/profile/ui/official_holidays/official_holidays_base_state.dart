part of 'official_holidays_screen.dart';

abstract class OfficialHolidaysPageBaseState
    extends State<OfficialHolidaysPage> {
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = ProfileCubit.get(context: context);
    profileCubit.listHolidaysFunc();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

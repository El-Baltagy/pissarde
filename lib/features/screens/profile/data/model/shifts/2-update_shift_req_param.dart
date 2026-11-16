class UpdateShiftReqParam {
  final String name;
  final String code;
  final String start_time;
  final String end_time;
  final String is_overnight;
  final String grace_period_minutes;
  final String checkin_window_start_minutes;
  final String checkin_window_end_minutes;
  final String break_duration_minutes;
  final List<dynamic> working_days;
  final String is_active;

  const UpdateShiftReqParam({
    required this.name,
    required this.code,
    required this.start_time,
    required this.end_time,
    required this.is_overnight,
    required this.grace_period_minutes,
    required this.checkin_window_start_minutes,
    required this.checkin_window_end_minutes,
    required this.break_duration_minutes,
    required this.working_days,
    required this.is_active,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'start_time': start_time,
        'end_time': end_time,
        'is_overnight': is_overnight,
        'grace_period_minutes': grace_period_minutes,
        'checkin_window_start_minutes': checkin_window_start_minutes,
        'checkin_window_end_minutes': checkin_window_end_minutes,
        'break_duration_minutes': break_duration_minutes,
        'working_days': working_days,
        'is_active': is_active,
      };
}

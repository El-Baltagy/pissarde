part of 'notifications_screen.dart';

abstract class NotificationsPageBaseState extends State<NotificationsPage> {
  late final NotificationsCubit notificationsCubit;

  @override
  void initState() {
    notificationsCubit = NotificationsCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

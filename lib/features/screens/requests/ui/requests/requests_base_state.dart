part of 'requests_screen.dart';

abstract class RequestsPageBaseState extends State<RequestsPage> {
  late final RequestsCubit requestsCubit;

  @override
  void initState() {
    requestsCubit = RequestsCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

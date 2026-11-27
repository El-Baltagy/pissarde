part of 'login_screen.dart';

abstract class LoginPageBaseState extends State<LoginPage> {
  late final LoginCubit argData;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final ValueNotifier<int> selectedTabNotifier = ValueNotifier<int>(0);
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field1 = (
    GlobalKey<FormFieldState<dynamic>>(),
      .new()
  );
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field2 = (
    GlobalKey<FormFieldState<dynamic>>(),
    .new()
  );  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field3 = (
    GlobalKey<FormFieldState<dynamic>>(),
      .new()
  );

  @override
  void initState() {
    super.initState();
    argData = LoginCubit.get(context: context);
    if (kDebugMode) {
      emailController.text = 'admin@pissarde.com';
      passwordController.text = 'Password123!';
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    selectedTabNotifier.dispose();
    field1.$2?.dispose();
    field2.$2?.dispose();
    field3.$2?.dispose();
    super.dispose();
  }

  void loginCubitListener(BuildContext context, LoginState state) {
    if (state is LoginResState) {
      if (state.baseEmit is Success<LoginRes>) {
        final LoginRes data = (state.baseEmit as Success<LoginRes>).data!;
        context.showToast(data.message);
        context.replace(MainNavigationRoute(args: const MainNavigationRouteArgs()));
      } else if (state.baseEmit is ErrorState) {
        final ErrorState data = state.baseEmit as ErrorState;
        context.showToast(data.failure.message, isSuccess: false);
      }
    }
  }
}

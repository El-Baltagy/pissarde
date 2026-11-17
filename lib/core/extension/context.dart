import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension AppRouterExtension on BuildContext {
  /// Access the [StackRouter] from any [BuildContext].


  /// Push a new [route] onto the stack.
  Future<T?> push<T extends Object?>(PageRouteInfo route) => AutoRouter.of(this).push<T>(route);

  /// Replace the current route with a new [route].
  Future<void> replace(PageRouteInfo route) => AutoRouter.of(this).replace(route);

  /// Push a new [route] and remove all previous routes until the [predicate] is met.
  Future<void> pushAndPopUntil(PageRouteInfo route, {required RoutePredicate predicate}) =>
      AutoRouter.of(this).pushAndPopUntil(route, predicate: predicate);

  /// Pop the current route from the stack.
  Future<bool> pop<T extends Object?>([T? result]) => AutoRouter.of(this).maybePop<T>(result);

  /// Pop all routes until the root route.
  void popUntilRoot() => AutoRouter.of(this).popUntilRoot();

   Future<dynamic>  pushNavigation(Widget widget,{
    Curve curve = Curves.easeInOutCubicEmphasized,
    double? X,
    double? Y,
  }) {
    return Navigator .push(this,_createRoute(widget,
        X: X,
        Y: Y,
        curve: curve));
  }
  /// Check if the router can pop.
  bool get canPop => AutoRouter.of(this).canPop();

  void unfocus()=> FocusScope.of(this).unfocus();
  // EdgeInsets get padding=> MediaQuery.of(this).padding;
  ThemeData get theme=> Theme.of(this);
  double get height=> MediaQuery.sizeOf(this).height;
  double get width=> MediaQuery.sizeOf(this).width;
  double get aspectRatio=> MediaQuery.sizeOf(this).aspectRatio;
  bool get isLTR=>Directionality.of(this)==.ltr;

  // double get getSizeInSaveArea=> height-(padding.top +padding.bottom);
  //  double get mobileNavigationBarHeight=>padding.bottom;
  //  double get mobileStatusBarHeight=>padding.top;
  // EdgeInsets get viewInsets=>MediaQuery.of(this).viewInsets;
  // bool get isKeyBoardOpened=>MediaQuery.of(this).viewInsets.bottom != 0;
  // double get keyBoardOpenPadding=>MediaQuery.of(this).viewInsets.bottom  ;

// void   showSnackBar(Widget content,[Color  backgroundColor=Colors.redAccent])=> ScaffoldMessenger.of(this).showSnackBar(
//     SnackBar(
//       content: content,
//       backgroundColor: backgroundColor  ,
//     ),
//   );
  Future<void> showToast( String? message, {
  Color? textColor,
  Color? backgroundColor,
    bool isSuccess=true,
  ToastGravity  gravity= .BOTTOM})async {
    if(message==null)return ;
    await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity  ,
        timeInSecForIosWeb: 3,
        backgroundColor: backgroundColor?? (isSuccess?theme.primaryColor:theme.colorScheme.error),
        textColor: textColor?? theme.scaffoldBackgroundColor,
        fontSize: 16.0);
  }
  PageRouteBuilder<dynamic> _createRoute(
      Widget sc, {
        Curve curve = Curves.easeInOutCubicEmphasized,
        double? X,
        double? Y,
      }) {
    return
      // Platform.isIos?
      // CupertinoPageTransitionsBuilder():
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => sc,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {


          var tween = Tween(begin: Offset(X ?? 0, Y ?? 0), end: Offset.zero).
          chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      )

    ;
  }
}

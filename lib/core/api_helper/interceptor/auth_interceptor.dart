import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import 'package:newf/core/base/base_local_repo.dart';

import 'package:newf/core/app/app.dart';
import 'package:newf/core/app/route.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.dio,
    required this.getAccessToken,
    required this.refreshToken,
    required this.localRepo,
  });
  final Dio dio;
  final BaseLocalRepo  localRepo;
  final Future<String?> Function()? getAccessToken;
  final Future<String?> Function()? refreshToken;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (getAccessToken != null) {
      final token = await getAccessToken!();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // If a session token is still saved, the server rejected it
      // (expired / invalid). Force the user back to the login screen
      // instead of leaving them on a broken session.
      final savedToken = await getAccessToken?.call();
      if (savedToken != null) {
        await  _clearSession();
           _goToLogin();
        return handler.next(err);
      }

      /// No saved token but a refresh callback is available — try to
      /// refresh and retry the original request.
      // if (refreshToken != null) {
      //   final newToken = await refreshToken!();
      //   if (newToken != null) {
      //     err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
      //     final response = await dio.fetch(err.requestOptions);
      //     return handler.resolve(response);
      //   }
      // }
    }
    handler.next(err);
  }

  Future<void> _clearSession() async {
    try {
      await  localRepo.clearAllData();
    } catch (_) {}
  }

  void _goToLogin() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        appRouter.replaceAll([const LoginRoute()]);
      } catch (_) {}
    });
  }
}

import 'package:dio/dio.dart';
import 'package:machine_learning_x_flutter/core/auth/auth_event_bus.dart';

class AuthInterceptor extends Interceptor {
  final AuthEventBus authEventBus;

  AuthInterceptor({required this.authEventBus});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;

    if (statusCode == 401) {
      authEventBus.add(LogoutEvent());
    }

    super.onError(err, handler);
  }
}

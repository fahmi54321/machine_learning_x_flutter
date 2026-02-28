import 'package:dio/dio.dart';
import 'package:machine_learning_x_flutter/core/auth/auth_event_bus.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  final AuthEventBus authEventBus;

  ErrorInterceptor({required this.authEventBus});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode;
    final data = err.response?.data;
    final message =
        data?['data']?['message'] ?? data?['message'] ?? 'Terjadi kesalahan';

    switch (status) {
      case 401:
        authEventBus.add(LogoutEvent());
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: UnauthorizedException(message),
          ),
        );
        return;

      case 404:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: NotFoundException(message),
          ),
        );
        return;

      case 422:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: ValidationException(message),
          ),
        );
        return;

      case 500:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: ServerException('Kesalahan server'),
          ),
        );
        return;

      default:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: UnknownException(message),
          ),
        );
        return;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode ?? 0;

    if (statusCode >= 200 && statusCode < 300) {
      handler.next(response);
    } else {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ),
      );
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;

    if (statusCode == 401) {
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: UnauthorizedException(),
        ),
      );
      return;
    }

    handler.next(err);
  }
}

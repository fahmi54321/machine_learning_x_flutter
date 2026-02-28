import 'dart:io';

abstract class AppException implements Exception {
  final String message;
  const AppException(this.message);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException(String message) : super(message);
}

class NotFoundException extends AppException {
  const NotFoundException(String message) : super(message);
}

class ValidationException extends AppException {
  const ValidationException(String message) : super(message);
}

class ServerException extends AppException {
  const ServerException(String message) : super(message);
}

class NetworkException extends AppException {
  const NetworkException() : super("Koneksi bermasalah");
}

class UnknownException extends HttpException {
  UnknownException(super.message);
}

class CacheExceptions extends AppException {
  const CacheExceptions(String message) : super(message);
}

class PermissionException extends AppException {
  const PermissionException(String message) : super(message);
}

class CameraException extends AppException {
  const CameraException(String message) : super(message);
}

class FilePickerException extends AppException {
  const FilePickerException(String message) : super(message);
}

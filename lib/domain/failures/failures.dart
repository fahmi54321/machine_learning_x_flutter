abstract class Failure {
  final String message;
  const Failure(this.message);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(String message) : super(message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(String message) : super(message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super("Koneksi bermasalah");
}

class PermissionFailure extends Failure {
  const PermissionFailure(String message) : super(message);
}

class GeneralFailure extends Failure {
  const GeneralFailure(String message) : super(message);
}

class CameraFailure extends Failure {
  const CameraFailure(String message) : super(message);
}

class FileFailure extends Failure {
  const FileFailure(String message) : super(message);
}

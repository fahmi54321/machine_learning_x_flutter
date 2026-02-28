import 'dart:async';

abstract class AuthEvent {}

class LogoutEvent extends AuthEvent {}

class AuthEventBus {
  AuthEventBus._internal();
  static final AuthEventBus _instance = AuthEventBus._internal();
  factory AuthEventBus() => _instance;

  final _controller = StreamController<AuthEvent>.broadcast();

  Stream<AuthEvent> get stream => _controller.stream;

  void add(AuthEvent event) {
    _controller.add(event);
  }

  void dispose() {
    _controller.close();
  }
}

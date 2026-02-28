import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/error/ui_error.dart';

class AppState extends ChangeNotifier {
  UiError? _error;
  UiError? _alert;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  UiError? get error => _error;
  UiError? get alert => _alert;

  void setError(UiError error) {
    _error = error;
    notifyListeners();
  }

  void setAlert(UiError alert) {
    _alert = alert;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void clearAlert() {
    _alert = null;
    notifyListeners();
  }
}

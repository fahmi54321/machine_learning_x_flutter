import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/app/app_navigator.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/container/glass_container.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/dialogs/alert_dialog.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/dialogs/confirmation_dialog.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/dialogs/glass_error_dialog.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/dialogs/single_action_dialog.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/loader/global_loading.dart';

class AppOverlayService {
  BuildContext? get _context => appNavigatorKey.currentState?.overlay?.context;

  AppOverlayService();

  bool _isShowing = false;

  void showLoading() {
    if (_isShowing) return;

    _isShowing = true;

    if (_context != null) {
      showDialog(
        context: _context!,
        barrierDismissible: false,
        barrierColor: Colors.black.withValues(alpha: 0.4),
        builder: (_) => const GlobalLoadingWidget(),
      );
    }
  }

  void hideLoading() {
    if (!_isShowing) return;

    if (_context != null) {
      Navigator.of(_context!, rootNavigator: true).pop();
      debugPrint('masuk sini pop');
      _isShowing = false;
    }
  }

  Future<void> showSuccess({
    required String message,
    String buttonText = "OK",
  }) async {
    if (_context != null) {
      return showDialog(
        context: _context!,
        builder: (_) =>
            SingleActionDialog(message: message, buttonText: buttonText),
      );
    }
  }

  Future<void> showError(String message) {
    final context = appNavigatorKey.currentContext;

    if (context == null) return Future.value();
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Error",
      barrierColor: Colors.black.withValues(alpha: 0.35),
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (_, __, ___) {
        return GlassErrorDialog(message: message);
      },
    );
  }

  void showSnackbar({
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    showGeneralDialog(
      context: _context!,
      barrierDismissible: true,
      barrierLabel: "Snackbar",
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: GlassContainer(
              glowColor: Colors.blueAccent,
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
          ),
        );
      },
    );

    Future.delayed(duration, () {
      Navigator.of(_context!, rootNavigator: true).pop();
    });
  }

  Future<bool?> showConfirmation({
    required String message,
    String yesText = "Yes",
    String noText = "No",
  }) async {
    if (_context != null) {
      return showDialog<bool>(
        context: _context!,
        builder: (_) => ConfirmationDialog(
          message: message,
          yesText: yesText,
          noText: noText,
        ),
      );
    } else {
      return null;
    }
  }

  Future<bool?> showAlert({
    required String message,
    String okText = "Ok",
  }) async {
    if (_context != null) {
      return showDialog<bool>(
        context: _context!,
        builder: (_) => AlertDialogWidget(message: message, okText: okText),
      );
    } else {
      return null;
    }
  }

  Future<void> showGlassBottomSheet({
    required Widget child,
    double height = 420,
  }) async {
    if (_context != null) {
      showModalBottomSheet(
        context: _context!,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (_) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                height: height,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  border: Border.all(color: Colors.white24),
                ),
                child: child,
              ),
            ),
          );
        },
      );
    }
  }
}

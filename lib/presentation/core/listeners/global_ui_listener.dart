import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/app/app_state.dart';
import 'package:machine_learning_x_flutter/presentation/core/services/app_overlay_service.dart';
import 'package:provider/provider.dart';

class GlobalUiListener extends StatefulWidget {
  final AppOverlayService overlayService;
  final Widget child;

  const GlobalUiListener({
    super.key,
    required this.overlayService,
    required this.child,
  });

  @override
  State<GlobalUiListener> createState() => _GlobalUiListenerState();
}

class _GlobalUiListenerState extends State<GlobalUiListener> {
  late AppState appState;

  @override
  void initState() {
    super.initState();
    appState = context.read<AppState>();
    appState.addListener(_handleStateChange);
  }

  void _handleStateChange() {
    // Loading
    if (appState.isLoading) {
      widget.overlayService.showLoading();
    } else {
      widget.overlayService.hideLoading();
    }

    // Error
    if (appState.error != null) {
      widget.overlayService.showError(appState.error!.message);
      appState.clearError();
    }

    // Alert
    if (appState.alert != null) {
      widget.overlayService.showAlert(message: appState.alert!.message);
      appState.clearAlert();
    }
  }

  @override
  void dispose() {
    appState.removeListener(_handleStateChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

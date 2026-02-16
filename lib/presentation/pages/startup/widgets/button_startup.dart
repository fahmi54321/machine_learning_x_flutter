import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/pages/startup/provider/startup_provider.dart';
import 'package:provider/provider.dart';

class ButtonStartup extends StatefulWidget {
  const ButtonStartup({super.key});

  @override
  State<ButtonStartup> createState() => _ButtonStartupState();
}

class _ButtonStartupState extends State<ButtonStartup> {
  bool isPressed = false;

  void setPressed(bool val) {
    isPressed = val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setPressed(true),
      onTapUp: (_) => setPressed(false),
      onTapCancel: () => setPressed(false),
      onTap: context.read<StartupProvider>().predict,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
        decoration: BoxDecoration(
          color: isPressed
              ? Colors.white.withValues(alpha: 0.18)
              : Colors.white.withValues(alpha: 0.28),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Text(
          'Predict Profit',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

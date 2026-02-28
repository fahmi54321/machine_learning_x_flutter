import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/container/glass_container.dart';

class SingleActionDialog extends StatelessWidget {
  final String message;
  final String buttonText;

  const SingleActionDialog({
    super.key,
    required this.message,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      glowColor: Colors.greenAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Colors.greenAccent, size: 42),
          const SizedBox(height: 20),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}

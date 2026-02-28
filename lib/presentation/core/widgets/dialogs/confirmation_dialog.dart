import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/container/glass_container.dart';

class ConfirmationDialog extends StatelessWidget {
  final String message;
  final String yesText;
  final String noText;

  const ConfirmationDialog({
    super.key,
    required this.message,
    required this.yesText,
    required this.noText,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      glowColor: Colors.orangeAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(noText),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(yesText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

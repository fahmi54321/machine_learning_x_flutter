import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';

class TitleSalaries extends StatelessWidget {
  const TitleSalaries({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    return Column(
      children: [
        Text('Salary Prediction System', style: theme.textTheme.displayLarge),
        const SizedBox(height: 8),
        Text(
          'Predict employee salary using Simple Linear Regression',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: glass.descriptionTextColor,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';

class TitleStartup extends StatelessWidget {
  const TitleStartup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    return Column(
      children: [
        Text('Startup Profit Prediction', style: theme.textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(
          'Multiple Linear Regression • Business Insight System',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: glass.descriptionTextColor,
          ),
        ),
      ],
    );
  }
}

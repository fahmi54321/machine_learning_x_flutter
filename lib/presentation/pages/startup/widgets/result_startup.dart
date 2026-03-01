import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';
import 'package:machine_learning_x_flutter/presentation/pages/startup/provider/startup_provider.dart';
import 'package:provider/provider.dart';

class ResultStartup extends StatelessWidget {
  const ResultStartup({super.key});

  @override
  Widget build(BuildContext context) {
    final profit = context
        .watch<StartupProvider>()
        .state
        .startupEntity
        ?.predictedProfit;
    final classification = context
        .watch<StartupProvider>()
        .state
        .startupEntity
        ?.classification;
    final description = context
        .watch<StartupProvider>()
        .state
        .startupEntity
        ?.description;
    final recommendations = context
        .watch<StartupProvider>()
        .state
        .startupEntity
        ?.recommendation;
    final theme = Theme.of(context);
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    return (profit ?? 0) <= 0
        ? Column(
            key: ValueKey(profit),
            children: [
              Text(
                '\$${profit?.toStringAsFixed(2)}',
                style: theme.textTheme.titleLarge?.copyWith(fontSize: 32.0),
              ),
              const SizedBox(height: 6),
              Text(
                classification ?? '-',

                style: theme.textTheme.bodyMedium?.copyWith(
                  color: glass.classificationTextColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description ?? '-',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: glass.descriptionTextColor,
                ),
              ),
              const SizedBox(height: 16),
              ...(recommendations ?? []).map(
                (e) => Text(
                  '• $e',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: glass.descriptionTextColor,
                  ),
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

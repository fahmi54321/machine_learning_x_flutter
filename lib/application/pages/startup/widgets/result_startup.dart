import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/application/pages/startup/provider/startup_provider.dart';
import 'package:machine_learning_x_flutter/application/pages/startup/provider/startup_state.dart';
import 'package:provider/provider.dart';

class ResultStartup extends StatelessWidget {
  const ResultStartup({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.watch<StartupProvider>().state.status == StartupStatus.loading;
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
    return isLoading
        ? const CircularProgressIndicator(color: Colors.white)
        : (profit ?? 0) > 0
        ? Column(
            key: ValueKey(profit),
            children: [
              Text(
                '\$${profit?.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                classification ?? '-',
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description ?? '-',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 16),
              ...(recommendations ?? []).map(
                (e) =>
                    Text('• $e', style: const TextStyle(color: Colors.white70)),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

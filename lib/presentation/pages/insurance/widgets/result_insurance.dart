import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/provider/insurance_provider.dart';
import 'package:provider/provider.dart';

class ResultInsurance extends StatelessWidget {
  const ResultInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    final predictedCharges = context
        .watch<InsuranceProvider>()
        .state
        .insuranceEntity
        .predictedCharges;
    final riskCategory = context
        .watch<InsuranceProvider>()
        .state
        .insuranceEntity
        .riskCategory;
    final description = context
        .watch<InsuranceProvider>()
        .state
        .insuranceEntity
        .description;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.2),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
      child: predictedCharges > 0
          ? _Result(
              riskCategory: riskCategory,
              predictedCharges: predictedCharges,
              description: description,
            )
          : const SizedBox.shrink(),
    );
  }
}

class _Result extends StatelessWidget {
  final String riskCategory;
  final double predictedCharges;
  final String description;
  const _Result({
    required this.riskCategory,
    required this.predictedCharges,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final riskColor = riskCategory == "Low Cost"
        ? Colors.greenAccent
        : riskCategory == "Medium Cost"
        ? Colors.orangeAccent
        : Colors.redAccent;
    return Column(
      key: ValueKey(predictedCharges),
      children: [
        Text(
          '\$${predictedCharges.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          riskCategory,
          style: TextStyle(
            color: riskColor,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}

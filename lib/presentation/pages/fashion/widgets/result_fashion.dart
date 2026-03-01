import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';
import 'package:machine_learning_x_flutter/presentation/pages/fashion/provider/fashion_predictor_provider.dart';
import 'package:provider/provider.dart';

class ResultFashion extends StatelessWidget {
  const ResultFashion({super.key});

  @override
  Widget build(BuildContext context) {
    final imageBytes = context
        .watch<FashionPredictorProvider>()
        .state
        .imageBase64;
    final prediction = context
        .watch<FashionPredictorProvider>()
        .state
        .prediction;
    final trueLabel = context.watch<FashionPredictorProvider>().state.trueLabel;
    final confidence = context
        .watch<FashionPredictorProvider>()
        .state
        .confidence;
    final description = context
        .watch<FashionPredictorProvider>()
        .state
        .description;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: imageBytes != null
          ? _Result(
              prediction: prediction,
              trueLabel: trueLabel,
              confidence: confidence,
              description: description,
              imageBytes: imageBytes,
            )
          : const SizedBox.shrink(),
    );
  }
}

class _Result extends StatelessWidget {
  final String prediction;
  final String trueLabel;
  final double confidence;
  final String description;
  final Uint8List imageBytes;
  const _Result({
    required this.prediction,
    required this.trueLabel,
    required this.confidence,
    required this.description,
    required this.imageBytes,
  });

  @override
  Widget build(BuildContext context) {
    final isCorrect = prediction == trueLabel;
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    final theme = Theme.of(context);

    final resultColor = isCorrect
        ? glass.goodResultColor
        : glass.badResultColor;
    return TweenAnimationBuilder<double>(
      key: ValueKey(prediction),
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.8, end: 1),
      curve: Curves.easeOutBack,
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: theme.colorScheme.surface.withValues(
            alpha: glass.backgroundAlpha,
          ),
          border: Border.all(color: theme.colorScheme.outline),
          boxShadow: [
            BoxShadow(
              color: resultColor.withValues(alpha: 0.25),
              blurRadius: 30,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.memory(
                imageBytes,
                width: 180,
                height: 180,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: resultColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: resultColor),
              ),
              child: Text(
                isCorrect ? "Correct Prediction" : "Incorrect Prediction",

                style: theme.textTheme.bodyMedium?.copyWith(
                  color: resultColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              prediction,

              style: theme.textTheme.titleLarge?.copyWith(letterSpacing: 1.1),
            ),

            const SizedBox(height: 6),

            if (!isCorrect)
              Text(
                "Actual: $trueLabel",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: glass.descriptionTextColor,
                ),
              ),

            const SizedBox(height: 18),

            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confidence ${(confidence * 100).toStringAsFixed(2)}%",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: glass.descriptionTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: confidence,
                    minHeight: 10,
                    valueColor: AlwaysStoppedAnimation(resultColor),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: glass.descriptionTextColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

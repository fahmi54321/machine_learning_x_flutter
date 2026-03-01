import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/cubit/predict_cubit.dart';

class ResultSalaries extends StatelessWidget {
  const ResultSalaries({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PredictCubit>().state;
    final salariesEntity = state.salariesEntity;
    final theme = Theme.of(context);
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    if (state.predictStatus == PredictStatus.error) {
      return Text(
        'Estimated Annual Salary',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: glass.descriptionTextColor,
        ),
      );
    } else {
      return Column(
        children: [
          Text(
            'Estimated Annual Salary',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: glass.descriptionTextColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '\$${salariesEntity?.predictionEntity?.salary.toStringAsFixed(2)}',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Text(
            salariesEntity?.explanation ?? "-",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: glass.descriptionTextColor,
            ),
          ),
          const SizedBox(height: 24),
          if (state.visualizationImage != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.memory(state.visualizationImage!),
            ),
        ],
      );
    }
  }
}

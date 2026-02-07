import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_learning_x_flutter/application/pages/salaries/cubit/predict_cubit.dart';

class ResultSalaries extends StatelessWidget {
  const ResultSalaries({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PredictCubit>().state;
    final salariesEntity = state.salariesEntity;
    if (state.predictStatus == PredictStatus.loading) {
      return const CircularProgressIndicator(color: Colors.white);
    } else if (state.predictStatus == PredictStatus.error) {
      return Text(
        'Estimated Annual Salary',
        style: TextStyle(color: Colors.white70),
      );
    } else {
      return Column(
        children: [
          Text(
            'Estimated Annual Salary',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 6),
          Text(
            '\$${salariesEntity?.predictionEntity?.salary.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            salariesEntity?.explanation ?? "-",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
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

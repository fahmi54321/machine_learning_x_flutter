import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/button/glass_primary_button.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/cubit/predict_cubit.dart';

class ButtonSalaries extends StatelessWidget {
  const ButtonSalaries({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassPrimaryButton(
      text: 'Predict Salary',
      onTap: () => context.read<PredictCubit>().predict(),
    );
  }
}

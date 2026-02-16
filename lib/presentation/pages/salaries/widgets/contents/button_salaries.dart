import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/cubit/predict_cubit.dart';

class ButtonSalaries extends StatefulWidget {
  const ButtonSalaries({super.key});

  @override
  State<ButtonSalaries> createState() => _ButtonSalariesState();
}

class _ButtonSalariesState extends State<ButtonSalaries> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = context.select((PredictCubit c) => c.isFormValid);

    return GestureDetector(
      onTapDown: isEnabled ? (_) => setState(() => isPressed = true) : null,
      onTapUp: isEnabled ? (_) => setState(() => isPressed = false) : null,
      onTapCancel: () => setState(() => isPressed = false),
      onTap: isEnabled ? () => context.read<PredictCubit>().predict() : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
        decoration: BoxDecoration(
          color: isEnabled
              ? (isPressed
                    ? Colors.white.withValues(alpha: 0.18)
                    : Colors.white.withValues(alpha: 0.28))
              : Colors.white.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            if (!isPressed && isEnabled)
              const BoxShadow(
                color: Colors.black26,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
          ],
        ),
        child: const Text(
          'Predict Salary',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

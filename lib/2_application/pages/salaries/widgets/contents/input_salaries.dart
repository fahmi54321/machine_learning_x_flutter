import 'package:flutter/material.dart';
import 'package:linear_regression_flutter/2_application/core/form/form_value.dart';
import 'package:linear_regression_flutter/2_application/pages/salaries/cubit/predict_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputSalaries extends StatelessWidget {
  const InputSalaries({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Years of Experience (e.g. 5.5)',
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          errorText:
              context
                      .read<PredictCubit>()
                      .state
                      .yearsOfExperience
                      .validationStatus ==
                  ValidationStatus.error
              ? 'Tidak boleh kosong'
              : null,
        ),

        onChanged: (value) {
          context.read<PredictCubit>().yearsChanged(value);
        },
      ),
    );
  }
}

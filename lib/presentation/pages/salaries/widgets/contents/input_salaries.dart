import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/cubit/predict_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputSalaries extends StatelessWidget {
  const InputSalaries({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<PredictCubit>().formKey,
      child: SizedBox(
        width: 360,
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Years of Experience (e.g. 5.5)',
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
      ),
    );
  }
}

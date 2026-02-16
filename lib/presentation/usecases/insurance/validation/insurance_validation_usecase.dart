import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';

abstract class InsuranceValidationUsecase {
  ValidationStatus ageValidation({required String? value});
  ValidationStatus bmiValidation({required String? value});
  ValidationStatus childrenValidation({required String? value});
}

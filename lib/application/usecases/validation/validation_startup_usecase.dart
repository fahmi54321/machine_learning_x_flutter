import 'package:machine_learning_x_flutter/application/core/form/form_value.dart';

abstract class ValidationStartupUsecase {
  ValidationStatus rdFormValidation({required String? value});
  ValidationStatus adminFormValidation({required String? value});
  ValidationStatus marketingFormValidation({required String? value});
}

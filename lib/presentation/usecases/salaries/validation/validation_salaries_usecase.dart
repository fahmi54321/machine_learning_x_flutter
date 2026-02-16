import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';

abstract class ValidationSalariesUsecase {
  ValidationStatus salariesValidation({required String? value});
}

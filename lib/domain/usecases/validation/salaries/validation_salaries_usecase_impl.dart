import 'package:machine_learning_x_flutter/application/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/application/usecases/validation/validation_salaries_usecase.dart';

class ValidationSalariesUsecaseImpl implements ValidationSalariesUsecase {
  @override
  ValidationStatus salariesValidation({required String? value}) {
    ValidationStatus currentStatus = ValidationStatus.idle;
    if (value == null || value.isEmpty) {
      currentStatus = ValidationStatus.error;
    } else {
      currentStatus = ValidationStatus.success;
    }

    return currentStatus;
  }
}

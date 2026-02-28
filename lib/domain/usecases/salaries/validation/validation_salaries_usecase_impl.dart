import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/salaries/validation/validation_salaries_usecase.dart';

class ValidationSalariesUsecaseImpl implements ValidationSalariesUsecase {
  @override
  ValidationStatus salariesValidation({required String? value}) {
    ValidationStatus currentStatus = ValidationStatus.initial;
    if (value == null || value.isEmpty) {
      currentStatus = ValidationStatus.error;
    } else {
      currentStatus = ValidationStatus.success;
    }

    return currentStatus;
  }
}

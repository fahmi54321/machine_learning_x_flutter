import 'package:linear_regression_flutter/2_application/core/form/form_value.dart';

class ValidationSalariesUsecase {
  ValidationStatus salariesValidation({required String? value}) {
    ValidationStatus currentStatus = ValidationStatus.pending;
    if (value == null || value.isEmpty) {
      currentStatus = ValidationStatus.error;
    } else {
      currentStatus = ValidationStatus.success;
    }

    return currentStatus;
  }
}

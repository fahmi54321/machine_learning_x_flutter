import 'package:machine_learning_x_flutter/application/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/application/usecases/validation/validation_startup_usecase.dart';

class ValidationStartupUsecaseImpl implements ValidationStartupUsecase {
  @override
  ValidationStatus adminFormValidation({required String? value}) {
    ValidationStatus currentStatus = ValidationStatus.idle;
    if (value == null || value.isEmpty) {
      currentStatus = ValidationStatus.error;
    } else {
      currentStatus = ValidationStatus.success;
    }

    return currentStatus;
  }

  @override
  ValidationStatus marketingFormValidation({required String? value}) {
    ValidationStatus currentStatus = ValidationStatus.idle;
    if (value == null || value.isEmpty) {
      currentStatus = ValidationStatus.error;
    } else {
      currentStatus = ValidationStatus.success;
    }

    return currentStatus;
  }

  @override
  ValidationStatus rdFormValidation({required String? value}) {
    ValidationStatus currentStatus = ValidationStatus.idle;
    if (value == null || value.isEmpty) {
      currentStatus = ValidationStatus.error;
    } else {
      currentStatus = ValidationStatus.success;
    }

    return currentStatus;
  }
}

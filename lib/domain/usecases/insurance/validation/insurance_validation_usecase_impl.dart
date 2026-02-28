import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/insurance/validation/insurance_validation_usecase.dart';

class InsuranceValidationUsecaseImpl implements InsuranceValidationUsecase {
  @override
  ValidationStatus ageValidation({required String? value}) {
    ValidationStatus status = ValidationStatus.initial;
    if (value == null || value.isEmpty) {
      status = ValidationStatus.error;
    } else {
      status = ValidationStatus.success;
    }

    return status;
  }

  @override
  ValidationStatus bmiValidation({required String? value}) {
    ValidationStatus status = ValidationStatus.initial;
    if (value == null || value.isEmpty) {
      status = ValidationStatus.error;
    } else {
      status = ValidationStatus.success;
    }

    return status;
  }

  @override
  ValidationStatus childrenValidation({required String? value}) {
    ValidationStatus status = ValidationStatus.initial;
    if (value == null || value.isEmpty) {
      status = ValidationStatus.error;
    } else {
      status = ValidationStatus.success;
    }

    return status;
  }
}

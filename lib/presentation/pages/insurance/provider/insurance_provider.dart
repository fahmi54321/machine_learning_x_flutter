import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/presentation/core/error/failure_messages.dart';

import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/core/params/insurance/startup_params.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/provider/insurance_state.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/converter/converter_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/insurance/insurance_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/insurance/validation/insurance_validation_usecase.dart';

class InsuranceProvider extends ChangeNotifier {
  final InsuranceValidationUsecase insuranceValidationUsecase;
  final InsuranceUsecase insuranceUsecase;
  final ConverterUsecase converterUsecase;
  InsuranceProvider({
    required this.insuranceValidationUsecase,
    required this.insuranceUsecase,
    required this.converterUsecase,
  });

  InsuranceState _state = InsuranceState.initial();

  InsuranceState get state => _state;

  void updateAge(String value) {
    final status = insuranceValidationUsecase.ageValidation(value: value);
    _state = _state.copyWith(
      age: FormValue(value: value, validationStatus: status),
    );
    notifyListeners();
  }

  void updateBmi(String value) {
    final status = insuranceValidationUsecase.bmiValidation(value: value);
    _state = _state.copyWith(
      bmi: FormValue(value: value, validationStatus: status),
    );
    notifyListeners();
  }

  void updateChildren(String value) {
    final status = insuranceValidationUsecase.childrenValidation(value: value);
    _state = _state.copyWith(
      children: FormValue(value: value, validationStatus: status),
    );
    notifyListeners();
  }

  bool get isValid =>
      _state.age.validationStatus == ValidationStatus.success &&
      _state.bmi.validationStatus == ValidationStatus.success &&
      _state.children.validationStatus == ValidationStatus.success;

  Future<void> predict() async {
    if (!isValid) {
      return;
    }

    _state = _state.copyWith(status: InsuranceStatus.loading);
    notifyListeners();

    final failureOrSuccess = await insuranceUsecase.predictInsurance(
      params: InsuranceParams(
        age: converterUsecase.stringToInt(value: _state.age.value),
        sex: _state.selectedSex,
        bmi: _state.bmi.value,
        children: converterUsecase.stringToInt(value: _state.children.value),
        smoker: _state.selectedSmoker,
        region: _state.selectedRegion,
      ),
    );

    failureOrSuccess.fold(
      (failure) {
        _state = _state.copyWith(
          status: InsuranceStatus.error,
          errorMessage: _mapFailureToMessage(failure),
        );
        notifyListeners();
      },
      (insurance) {
        _state = _state.copyWith(
          status: InsuranceStatus.success,
          insuranceEntity: insurance,
        );
        notifyListeners();
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        {
          return serverFailureMessage;
        }
      case CacheFailure _:
        {
          return cacheFailureMessage;
        }
      default:
        {
          return generalFailureMessage;
        }
    }
  }

  void updateSelectedSex(String? v) {
    _state = _state.copyWith(selectedSex: v);
    notifyListeners();
  }

  void updateSelectedSmoker(String? v) {
    _state = _state.copyWith(selectedSmoker: v);
    notifyListeners();
  }

  void updateSelectedRegion(String? v) {
    _state = _state.copyWith(selectedRegion: v);
    notifyListeners();
  }
}

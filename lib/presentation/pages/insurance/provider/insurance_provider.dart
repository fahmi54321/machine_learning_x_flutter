import 'package:flutter/material.dart';

import 'package:machine_learning_x_flutter/domain/entities/params/insurance/startup_params_entity.dart';
import 'package:machine_learning_x_flutter/presentation/app/app_state.dart';
import 'package:machine_learning_x_flutter/presentation/core/error/ui_error.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/provider/insurance_state.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/converter/converter_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/insurance/insurance_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/insurance/validation/insurance_validation_usecase.dart';

class InsuranceProvider extends ChangeNotifier {
  final InsuranceValidationUsecase insuranceValidationUsecase;
  final InsuranceUsecase insuranceUsecase;
  final ConverterUsecase converterUsecase;
  final AppState appState;
  InsuranceProvider({
    required this.insuranceValidationUsecase,
    required this.insuranceUsecase,
    required this.converterUsecase,
    required this.appState,
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

  bool get isValid {
    if (_state.age.validationStatus != ValidationStatus.success) {
      _handleAlert('Age tidak boleh kosong');
      return false;
    } else if (_state.bmi.validationStatus != ValidationStatus.success) {
      _handleAlert('bmi tidak boleh kosong');
      return false;
    } else if (_state.children.validationStatus != ValidationStatus.success) {
      _handleAlert('children tidak boleh kosong');
      return false;
    } else {
      return true;
    }
  }

  Future<void> predict() async {
    if (!isValid) {
      return;
    }

    debugPrint('masuk 1');

    _state = _state.copyWith(status: InsuranceStatus.loading);
    notifyListeners();

    _handleLoader(true);

    debugPrint('masuk 2');

    final failureOrSuccess = await insuranceUsecase.predictInsurance(
      params: InsuranceParamsEntity(
        age: converterUsecase.stringToInt(value: _state.age.value),
        sex: _state.selectedSex,
        bmi: _state.bmi.value,
        children: converterUsecase.stringToInt(value: _state.children.value),
        smoker: _state.selectedSmoker,
        region: _state.selectedRegion,
      ),
    );

    _handleLoader(false);

    debugPrint('masuk 3');

    failureOrSuccess.fold(
      (failure) {
        _state = _state.copyWith(status: InsuranceStatus.error);
        notifyListeners();
        _handleFailure(failure.message);
        debugPrint('masuk 4, error" ${failure.message}');
      },
      (insurance) {
        _state = _state.copyWith(
          status: InsuranceStatus.success,
          insuranceEntity: insurance,
        );
        notifyListeners();
        debugPrint('masuk 5');
      },
    );
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

  void _handleFailure(String message) {
    appState.setError(UiError(source: ErrorSource.insurance, message: message));
  }

  void _handleAlert(String message) {
    appState.setAlert(UiError(source: ErrorSource.insurance, message: message));
  }

  void _handleLoader(bool val) {
    appState.setLoading(val);
  }
}

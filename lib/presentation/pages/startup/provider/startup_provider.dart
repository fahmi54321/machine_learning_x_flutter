// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:machine_learning_x_flutter/domain/entities/params/startup/startup_params_entity.dart';
import 'package:machine_learning_x_flutter/presentation/app/app_state.dart';
import 'package:machine_learning_x_flutter/presentation/core/error/ui_error.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/pages/startup/provider/startup_state.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/converter/converter_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/startup/startup_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/startup/validation/validation_startup_usecase.dart';

class StartupProvider extends ChangeNotifier {
  final ValidationStartupUsecase validationStartupUsecase;
  final StartupUsecase startupUsecase;
  final ConverterUsecase converterUsecase;
  final AppState appState;

  StartupState _state = StartupState.initial();
  StartupState get state => _state;

  StartupProvider({
    required this.validationStartupUsecase,
    required this.startupUsecase,
    required this.converterUsecase,
    required this.appState,
  });

  void rdChanged(String val) {
    final status = validationStartupUsecase.rdFormValidation(value: val);
    _state = _state.copyWith(
      rdForm: FormValue(value: val, validationStatus: status),
    );
    notifyListeners();
  }

  void adminChanged(String val) {
    final status = validationStartupUsecase.adminFormValidation(value: val);
    _state = _state.copyWith(
      adminForm: FormValue(value: val, validationStatus: status),
    );
    notifyListeners();
  }

  void marketingChanged(String val) {
    final status = validationStartupUsecase.marketingFormValidation(value: val);
    _state = _state.copyWith(
      marketingForm: FormValue(value: val, validationStatus: status),
    );
    notifyListeners();
  }

  bool get isFormValid {
    if (_state.rdForm.validationStatus != ValidationStatus.success) {
      _handleAlert('Rd tidak boleh kosong');
      return false;
    } else if (_state.adminForm.validationStatus != ValidationStatus.success) {
      _handleAlert('Admin tidak boleh kosong');
      return false;
    } else if (_state.marketingForm.validationStatus !=
        ValidationStatus.success) {
      _handleAlert('Marketing tidak boleh kosong');
      return false;
    } else {
      return true;
    }
  }

  Future<void> predict() async {
    if (!isFormValid) {
      return;
    }

    _state = _state.copyWith(status: StartupStatus.loading);
    notifyListeners();

    _handleLoader(true);

    final failureOrPredicted = await startupUsecase.predict(
      params: PredictStartupParamsEntity(
        rdSpend: converterUsecase.stringToDouble(value: _state.rdForm.value),
        administration: converterUsecase.stringToDouble(
          value: _state.adminForm.value,
        ),
        marketingSpend: converterUsecase.stringToDouble(
          value: _state.marketingForm.value,
        ),
        state: _state.selectedState,
      ),
    );

    _handleLoader(false);

    failureOrPredicted.fold(
      (failure) {
        _state = _state.copyWith(status: StartupStatus.error);
        notifyListeners();
        _handleFailure(failure.message);
      },
      (predicted) {
        _state = _state.copyWith(
          status: StartupStatus.success,
          startupEntity: predicted,
        );
        notifyListeners();
      },
    );
  }

  void updateSelectedState(String? v) {
    if (v != null) {
      _state = _state.copyWith(selectedState: v);
      notifyListeners();
    }
  }

  void _handleFailure(String message) {
    appState.setError(UiError(source: ErrorSource.startup, message: message));
  }

  void _handleAlert(String message) {
    appState.setAlert(UiError(source: ErrorSource.salaries, message: message));
  }

  void _handleLoader(bool val) {
    appState.setLoading(val);
  }
}

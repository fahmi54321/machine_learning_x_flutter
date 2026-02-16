// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/presentation/core/error/failure_messages.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/core/params/startup/startup_params.dart';
import 'package:machine_learning_x_flutter/presentation/pages/startup/provider/startup_state.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/converter/converter_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/startup/startup_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/startup/validation/validation_startup_usecase.dart';

class StartupProvider extends ChangeNotifier {
  final ValidationStartupUsecase validationStartupUsecase;
  final StartupUsecase startupUsecase;
  final ConverterUsecase converterUsecase;

  StartupState _state = StartupState.initial();
  StartupState get state => _state;

  StartupProvider({
    required this.validationStartupUsecase,
    required this.startupUsecase,
    required this.converterUsecase,
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

  bool get isFormValid => _state.isFormValid;

  Future<void> predict() async {
    if (!isFormValid) {
      return;
    }

    _state = _state.copyWith(status: StartupStatus.loading);
    notifyListeners();

    final failureOrPredicted = await startupUsecase.predict(
      params: PredictStartupParams(
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

    failureOrPredicted.fold(
      (failure) {
        _state = _state.copyWith(
          status: StartupStatus.error,
          errorMessage: _mapFailureToMessage(failure),
        );
        notifyListeners();
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
}

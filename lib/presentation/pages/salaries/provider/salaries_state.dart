// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:machine_learning_x_flutter/domain/entities/salaries/salaries_entity.dart';
import 'package:machine_learning_x_flutter/presentation/app/app_state.dart';
import 'package:machine_learning_x_flutter/presentation/core/error/ui_error.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/cubit/predict_cubit.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/salaries/salaries_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/salaries/validation/validation_salaries_usecase.dart';

class SalariesState extends ChangeNotifier {
  final ValidationSalariesUsecase validationSalariesUsecase;
  final SalariesUseCase salariesUseCase;
  final AppState appState;
  final GlobalKey formKey = GlobalKey();

  SalariesState({
    required this.validationSalariesUsecase,
    required this.salariesUseCase,
    required this.appState,
  });

  FormValue<String> yearsOfExperience = FormValue(
    value: '',
    validationStatus: ValidationStatus.initial,
  );
  SalariesEntity? salariesEntity;
  PredictStatus predictStatus = PredictStatus.idle;
  Uint8List? visualizationImage;

  Future<void> yearsChanged(String val) async {
    final status = validationSalariesUsecase.salariesValidation(value: val);

    yearsOfExperience = FormValue(value: val, validationStatus: status);
    notifyListeners();
  }

  bool get isFormValid {
    if (yearsOfExperience.validationStatus == ValidationStatus.success) {
      return true;
    } else {
      _handleAlert('Years Of Experience tidak boleh kosong');
      return false;
    }
  }

  Future<void> predict() async {
    if (!isFormValid) return;

    predictStatus = PredictStatus.loading;
    salariesEntity = null;
    notifyListeners();

    _handleLoader(true);

    final failureOrSalaries = await salariesUseCase.loadPredict(
      val: yearsOfExperience.value,
    );

    _handleLoader(false);

    failureOrSalaries.fold(
      (failure) {
        predictStatus = PredictStatus.error;
        notifyListeners();

        _handleFailure(failure.message);
      },
      (salary) {
        salariesEntity = salary;
        predictStatus = PredictStatus.success;
        visualizationImage = base64Decode(
          salary.visualization?.imageBase64 ?? '',
        );
        notifyListeners();
      },
    );
  }

  void _handleFailure(String message) {
    appState.setError(UiError(source: ErrorSource.salaries, message: message));
  }

  void _handleAlert(String message) {
    appState.setAlert(UiError(source: ErrorSource.salaries, message: message));
  }

  void _handleLoader(bool val) {
    appState.setLoading(val);
  }
}

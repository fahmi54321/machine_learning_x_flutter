import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:machine_learning_x_flutter/domain/entities/salaries/salaries_entity.dart';
import 'package:machine_learning_x_flutter/presentation/app/app_state.dart';
import 'package:machine_learning_x_flutter/presentation/core/error/ui_error.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/salaries/salaries_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/salaries/validation/validation_salaries_usecase.dart';

part 'predict_state.dart';

class PredictCubit extends Cubit<PredictState> {
  final ValidationSalariesUsecase validationSalariesUsecase;
  final SalariesUseCase salariesUseCase;
  final AppState appState;
  PredictCubit({
    required this.validationSalariesUsecase,
    required this.salariesUseCase,
    required this.appState,
  }) : super(PredictState.initial());

  Future<void> yearsChanged(String val) async {
    final status = validationSalariesUsecase.salariesValidation(value: val);

    emit(
      state.copyWith(
        yearsOfExperience: FormValue(value: val, validationStatus: status),
      ),
    );
  }

  bool get isFormValid {
    if (state.yearsOfExperience.validationStatus == ValidationStatus.success) {
      return true;
    } else {
      _handleAlert('Years of Experience tidak boleh kosong');
      return false;
    }
  }

  GlobalKey formKey = GlobalKey();

  Future<void> predict() async {
    if (!isFormValid) return;

    _handleLoader(true);

    emit(
      state.copyWith(
        predictStatus: PredictStatus.loading,
        salariesEntity: null,
      ),
    );

    final failureOrSalaries = await salariesUseCase.loadPredict(
      val: state.yearsOfExperience.value,
    );

    _handleLoader(false);

    failureOrSalaries.fold(
      (failure) {
        emit(state.copyWith(predictStatus: PredictStatus.error));
        _handleFailure(failure.message);
      },
      (salary) => emit(
        state.copyWith(
          salariesEntity: salary,
          predictStatus: PredictStatus.success,
          visualizationImage: base64Decode(
            salary.visualization?.imageBase64 ?? '',
          ),
        ),
      ),
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

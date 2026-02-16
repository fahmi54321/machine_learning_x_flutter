import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_learning_x_flutter/domain/entities/salaries/salaries_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';

import 'package:machine_learning_x_flutter/presentation/core/error/failure_messages.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/salaries/salaries_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/salaries/validation/validation_salaries_usecase.dart';

part 'predict_state.dart';

class PredictCubit extends Cubit<PredictState> {
  final ValidationSalariesUsecase validationSalariesUsecase;
  final SalariesUseCase salariesUseCase;
  PredictCubit({
    required this.validationSalariesUsecase,
    required this.salariesUseCase,
  }) : super(PredictState.initial());

  Future<void> yearsChanged(String val) async {
    final status = validationSalariesUsecase.salariesValidation(value: val);

    emit(
      state.copyWith(
        yearsOfExperience: FormValue(value: val, validationStatus: status),
      ),
    );
  }

  bool get isFormValid =>
      state.yearsOfExperience.validationStatus == ValidationStatus.success;

  GlobalKey formKey = GlobalKey();

  Future<void> predict() async {
    if (!isFormValid) return;

    emit(
      state.copyWith(
        predictStatus: PredictStatus.loading,
        errorMessage: '',
        salariesEntity: null,
      ),
    );

    final failureOrSalaries = await salariesUseCase.loadPredict(
      val: state.yearsOfExperience.value,
    );

    failureOrSalaries.fold(
      (failure) => emit(
        state.copyWith(
          predictStatus: PredictStatus.error,
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
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

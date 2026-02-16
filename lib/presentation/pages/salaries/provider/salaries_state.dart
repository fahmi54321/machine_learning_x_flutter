// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:machine_learning_x_flutter/domain/entities/salaries/salaries_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/presentation/core/error/failure_messages.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/cubit/predict_cubit.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/salaries/salaries_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/salaries/validation/validation_salaries_usecase.dart';

class SalariesState extends ChangeNotifier {
  final ValidationSalariesUsecase validationSalariesUsecase;
  final SalariesUseCase salariesUseCase;
  final GlobalKey formKey = GlobalKey();

  SalariesState({
    required this.validationSalariesUsecase,
    required this.salariesUseCase,
  });

  FormValue<String> yearsOfExperience = FormValue(
    value: '',
    validationStatus: ValidationStatus.idle,
  );
  SalariesEntity? salariesEntity;
  PredictStatus predictStatus = PredictStatus.idle;
  String? errorMessage;
  Uint8List? visualizationImage;

  Future<void> yearsChanged(String val) async {
    final status = validationSalariesUsecase.salariesValidation(value: val);

    yearsOfExperience = FormValue(value: val, validationStatus: status);
    notifyListeners();
  }

  bool get isFormValid =>
      yearsOfExperience.validationStatus == ValidationStatus.success;

  Future<void> predict() async {
    if (!isFormValid) return;

    predictStatus = PredictStatus.loading;
    errorMessage = '';
    salariesEntity = null;
    notifyListeners();

    final failureOrSalaries = await salariesUseCase.loadPredict(
      val: yearsOfExperience.value,
    );

    failureOrSalaries.fold(
      (failure) {
        predictStatus = PredictStatus.error;
        errorMessage = _mapFailureToMessage(failure);
      },
      (salary) {
        salariesEntity = salary;
        predictStatus = PredictStatus.success;
        visualizationImage = base64Decode(
          salary.visualization?.imageBase64 ?? '',
        );
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
}

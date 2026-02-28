// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:machine_learning_x_flutter/presentation/app/app_state.dart';
import 'package:machine_learning_x_flutter/presentation/core/error/ui_error.dart';
import 'package:machine_learning_x_flutter/presentation/pages/fashion/provider/fashion_predictor_state.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/converter/converter_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/fashion/fashion_usecase.dart';

class FashionPredictorProvider extends ChangeNotifier {
  final FashionUsecase fashionUsecase;
  final ConverterUsecase converterUsecase;
  final AppState appState;
  FashionPredictorState _state = FashionPredictorState.initial();

  FashionPredictorProvider({
    required this.fashionUsecase,
    required this.converterUsecase,
    required this.appState,
  });
  FashionPredictorState get state => _state;

  Future<void> predict() async {
    _state = _state.copyWith(status: FashionPredictorStatus.loading);
    notifyListeners();

    _handleLoader(true);

    final failureOrFashion = await fashionUsecase.predict();

    _handleLoader(false);
    failureOrFashion.fold(
      (failure) {
        _state = _state.copyWith(status: FashionPredictorStatus.error);
        notifyListeners();

        _handleFailure(failure.message);
      },
      (fashion) {
        _state = _state.copyWith(
          status: FashionPredictorStatus.success,
          prediction: fashion.prediction,
          description: fashion.description,
          trueLabel: fashion.trueLabel,
          confidence: fashion.confidence,
          imageBase64: converterUsecase.base64ToUint8List(
            val: fashion.imageBase64,
          ),
        );
        notifyListeners();
      },
    );
  }

  void _handleFailure(String message) {
    appState.setError(UiError(source: ErrorSource.fashion, message: message));
  }

  void _handleLoader(bool val) {
    appState.setLoading(val);
  }
}

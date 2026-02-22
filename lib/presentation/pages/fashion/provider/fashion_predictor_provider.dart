import 'package:flutter/material.dart';

import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/presentation/core/error/failure_messages.dart';
import 'package:machine_learning_x_flutter/presentation/pages/fashion/provider/fashion_predictor_state.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/converter/converter_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/fashion/fashion_usecase.dart';

class FashionPredictorProvider extends ChangeNotifier {
  final FashionUsecase fashionUsecase;
  final ConverterUsecase converterUsecase;
  FashionPredictorState _state = FashionPredictorState.initial();

  FashionPredictorProvider({
    required this.fashionUsecase,
    required this.converterUsecase,
  });
  FashionPredictorState get state => _state;

  Future<void> predict() async {
    _state = _state.copyWith(status: FashionPredictorStatus.loading);
    notifyListeners();

    final failureOrFashion = await fashionUsecase.predict();
    failureOrFashion.fold(
      (failure) {
        _state = _state.copyWith(
          status: FashionPredictorStatus.error,
          errorMessage: _mapFailureToMessage(failure),
        );
        notifyListeners();
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

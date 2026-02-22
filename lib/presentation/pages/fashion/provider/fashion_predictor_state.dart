// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

enum FashionPredictorStatus { initial, loading, success, error }

class FashionPredictorState extends Equatable {
  final FashionPredictorStatus status;
  final String description;
  final String prediction;
  final String trueLabel;
  final double confidence;
  final Uint8List? imageBase64;
  final String errorMessage;
  const FashionPredictorState({
    required this.status,
    required this.description,
    required this.prediction,
    required this.trueLabel,
    required this.confidence,
    required this.imageBase64,
    required this.errorMessage,
  });

  factory FashionPredictorState.initial() {
    return FashionPredictorState(
      status: FashionPredictorStatus.initial,
      description: '',
      prediction: '',
      trueLabel: '',
      confidence: 0,
      imageBase64: null,
      errorMessage: '',
    );
  }
  @override
  List<Object?> get props {
    return [
      status,
      description,
      prediction,
      trueLabel,
      confidence,
      imageBase64,
      errorMessage,
    ];
  }

  FashionPredictorState copyWith({
    FashionPredictorStatus? status,
    String? description,
    String? prediction,
    String? trueLabel,
    double? confidence,
    Uint8List? imageBase64,
    String? errorMessage,
  }) {
    return FashionPredictorState(
      status: status ?? this.status,
      description: description ?? this.description,
      prediction: prediction ?? this.prediction,
      trueLabel: trueLabel ?? this.trueLabel,
      confidence: confidence ?? this.confidence,
      imageBase64: imageBase64 ?? this.imageBase64,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool get stringify => true;
}

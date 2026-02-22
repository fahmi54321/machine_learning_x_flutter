import 'package:equatable/equatable.dart';

class FashionEntity extends Equatable {
  final double confidence;
  final String description;
  final String prediction;
  final String trueLabel;
  final String imageBase64;
  const FashionEntity({
    required this.confidence,
    required this.description,
    required this.prediction,
    required this.trueLabel,
    required this.imageBase64,
  });

  @override
  List<Object> get props {
    return [confidence, description, prediction, trueLabel, imageBase64];
  }
}

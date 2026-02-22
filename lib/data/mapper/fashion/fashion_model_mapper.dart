import 'package:machine_learning_x_flutter/data/models/fashion/fashion_model.dart';
import 'package:machine_learning_x_flutter/domain/entities/fashion/fashion_entity.dart';

extension FashionModelMapper on FashionModel {
  FashionEntity toEntity() {
    return FashionEntity(
      confidence: confidence,
      description: description,
      prediction: prediction,
      trueLabel: trueLabel,
      imageBase64: imageBase64,
    );
  }
}

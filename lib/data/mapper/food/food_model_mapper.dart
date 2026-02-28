import 'package:machine_learning_x_flutter/data/models/food/food_model.dart';
import 'package:machine_learning_x_flutter/domain/entities/food/food_entity.dart';

extension FoodModelMapper on FoodModel {
  FoodEntity toEntity() {
    return FoodEntity(
      confidence: confidence,
      description: description,
      prediction: prediction,
      trueLabel: trueLabel,
      imageBase64: imageBase64,
    );
  }
}

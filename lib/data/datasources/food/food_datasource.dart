import 'package:machine_learning_x_flutter/data/models/food/food_model.dart';

abstract class FoodDatasource {
  Future<FoodModel> predict({
    required String imagePath,
    required String trueLabel,
  });
}

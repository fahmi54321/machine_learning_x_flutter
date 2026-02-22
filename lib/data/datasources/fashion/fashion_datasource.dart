import 'package:machine_learning_x_flutter/data/models/fashion/fashion_model.dart';

abstract class FashionDatasource {
  Future<FashionModel> predict();
}

import 'package:machine_learning_x_flutter/domain/entities/params/params_entity.dart';

class FoodParamsEntity extends ParamsEntity {
  final String imagePath;
  final String trueLabel;
  FoodParamsEntity({required this.imagePath, required this.trueLabel});

  @override
  List<Object?> get props => [imagePath, trueLabel];
}

import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/entities/food/food_entity.dart';
import 'package:machine_learning_x_flutter/domain/entities/params/food/food_params_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';

abstract class FoodRepository {
  Future<Either<Failure, FoodEntity>> predict({
    required FoodParamsEntity params,
  });
}

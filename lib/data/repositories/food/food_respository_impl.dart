import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:machine_learning_x_flutter/data/datasources/food/food_datasource.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';
import 'package:machine_learning_x_flutter/data/mapper/food/food_model_mapper.dart';
import 'package:machine_learning_x_flutter/domain/entities/food/food_entity.dart';
import 'package:machine_learning_x_flutter/domain/entities/params/food/food_params_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/food/food_repository.dart';

class FoodRespositoryImpl implements FoodRepository {
  final FoodDatasource foodDatasource;
  const FoodRespositoryImpl({required this.foodDatasource});
  @override
  Future<Either<Failure, FoodEntity>> predict({
    required FoodParamsEntity params,
  }) async {
    try {
      final result = await foodDatasource.predict(
        imagePath: params.imagePath,
        trueLabel: params.trueLabel,
      );
      return right(result.toEntity());
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    } on NetworkException {
      return Left(NetworkFailure());
    } catch (e) {
      log('error: $e');
      return Left(ServerFailure('Terjadi kesalahan'));
    }
  }
}

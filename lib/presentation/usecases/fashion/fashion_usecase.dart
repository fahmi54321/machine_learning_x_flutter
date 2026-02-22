import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/entities/fashion/fashion_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';

abstract class FashionUsecase {
  Future<Either<Failure, FashionEntity>> predict();
}

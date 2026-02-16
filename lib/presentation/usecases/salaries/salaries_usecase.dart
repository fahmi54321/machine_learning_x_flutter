import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/entities/salaries/salaries_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';

abstract class SalariesUseCase {
  Future<Either<Failure, SalariesEntity>> loadPredict({required String val});
}

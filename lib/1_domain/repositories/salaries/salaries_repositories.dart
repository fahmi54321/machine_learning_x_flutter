import 'package:dartz/dartz.dart';
import 'package:linear_regression_flutter/1_domain/entities/salaries/salaries_entity.dart';
import 'package:linear_regression_flutter/1_domain/failures/failures.dart';

abstract class SalariesRepositories {
  Future<Either<Failure, SalariesEntity>> loadPredict({required String val});
}

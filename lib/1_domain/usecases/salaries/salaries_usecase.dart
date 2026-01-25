import 'package:dartz/dartz.dart';
import 'package:linear_regression_flutter/1_domain/entities/salaries/salaries_entity.dart';
import 'package:linear_regression_flutter/1_domain/failures/failures.dart';
import 'package:linear_regression_flutter/1_domain/repositories/salaries/salaries_repositories.dart';

class SalariesUseCase {
  final SalariesRepositories salariesRepositories;
  SalariesUseCase({required this.salariesRepositories});
  Future<Either<Failure, SalariesEntity>> loadPredict({
    required String val,
  }) async {
    return salariesRepositories.loadPredict(val: val);
  }
}

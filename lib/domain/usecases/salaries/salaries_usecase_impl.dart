import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/entities/salaries/salaries_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/salaries/salaries_repositories.dart';
import 'package:machine_learning_x_flutter/application/usecases/salaries/salaries_usecase.dart';

class SalariesUseCaseImpl implements SalariesUseCase {
  final SalariesRepositories salariesRepositories;
  SalariesUseCaseImpl({required this.salariesRepositories});

  @override
  Future<Either<Failure, SalariesEntity>> loadPredict({
    required String val,
  }) async {
    return salariesRepositories.loadPredict(val: val);
  }
}

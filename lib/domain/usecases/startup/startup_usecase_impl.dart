import 'package:dartz/dartz.dart';

import 'package:machine_learning_x_flutter/domain/entities/startup/startup_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/startup/startup_repository.dart';
import 'package:machine_learning_x_flutter/application/core/params/startup/startup_params.dart';
import 'package:machine_learning_x_flutter/application/usecases/startup/startup_usecase.dart';

class StartupUsecaseImpl implements StartupUsecase {
  final StartupRepository startupRepository;
  StartupUsecaseImpl({required this.startupRepository});
  @override
  Future<Either<Failure, StartupEntity>> predict({
    required PredictStartupParams params,
  }) {
    return startupRepository.predict(params: params);
  }
}

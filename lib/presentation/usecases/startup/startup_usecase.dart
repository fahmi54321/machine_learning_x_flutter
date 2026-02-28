import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/entities/startup/startup_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/entities/params/startup/startup_params_entity.dart';

abstract class StartupUsecase {
  Future<Either<Failure, StartupEntity>> predict({
    required PredictStartupParamsEntity params,
  });
}

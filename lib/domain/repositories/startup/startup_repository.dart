import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/entities/startup/startup_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/presentation/core/params/startup/startup_params.dart';

abstract class StartupRepository {
  Future<Either<Failure, StartupEntity>> predict({
    required PredictStartupParams params,
  });
}

import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/entities/insurance/insurance_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/presentation/core/params/insurance/startup_params.dart';

abstract class InsuranceRepository {
  Future<Either<Failure, InsuranceEntity>> predictInsurance({
    required InsuranceParams params,
  });
}

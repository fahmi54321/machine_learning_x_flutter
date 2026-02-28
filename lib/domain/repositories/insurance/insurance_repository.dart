import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/entities/insurance/insurance_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/entities/params/insurance/startup_params_entity.dart';

abstract class InsuranceRepository {
  Future<Either<Failure, InsuranceEntity>> predictInsurance({
    required InsuranceParamsEntity params,
  });
}

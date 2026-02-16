import 'package:dartz/dartz.dart';

import 'package:machine_learning_x_flutter/domain/entities/insurance/insurance_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/insurance/insurance_repository.dart';
import 'package:machine_learning_x_flutter/presentation/core/params/insurance/startup_params.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/insurance/insurance_usecase.dart';

class InsuranceUsecaseImpl implements InsuranceUsecase {
  final InsuranceRepository insuranceRepository;
  InsuranceUsecaseImpl({required this.insuranceRepository});
  @override
  Future<Either<Failure, InsuranceEntity>> predictInsurance({
    required InsuranceParams params,
  }) {
    return insuranceRepository.predictInsurance(params: params);
  }
}

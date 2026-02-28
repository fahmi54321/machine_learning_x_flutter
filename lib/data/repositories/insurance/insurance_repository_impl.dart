import 'package:dartz/dartz.dart';

import 'package:machine_learning_x_flutter/data/datasources/insurance/insurance_datasource.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';
import 'package:machine_learning_x_flutter/data/mapper/insurance/insurance_model_mapper.dart';
import 'package:machine_learning_x_flutter/domain/entities/insurance/insurance_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/insurance/insurance_repository.dart';
import 'package:machine_learning_x_flutter/domain/entities/params/insurance/startup_params_entity.dart';

class InsuranceRepositoryImpl implements InsuranceRepository {
  final InsuranceDatasource insuranceDatasource;
  const InsuranceRepositoryImpl({required this.insuranceDatasource});
  @override
  Future<Either<Failure, InsuranceEntity>> predictInsurance({
    required InsuranceParamsEntity params,
  }) async {
    try {
      final result = await insuranceDatasource.predictInsurance(params: params);
      return right(result.toEntity());
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    } on NetworkException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(ServerFailure('Terjadi kesalahan'));
    }
  }
}

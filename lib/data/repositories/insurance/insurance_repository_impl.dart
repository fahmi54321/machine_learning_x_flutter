import 'package:dartz/dartz.dart';

import 'package:machine_learning_x_flutter/data/datasources/insurance/insurance_datasource.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';
import 'package:machine_learning_x_flutter/data/mapper/insurance/insurance_model_mapper.dart';
import 'package:machine_learning_x_flutter/domain/entities/insurance/insurance_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/insurance/insurance_repository.dart';
import 'package:machine_learning_x_flutter/presentation/core/params/insurance/startup_params.dart';

class InsuranceRepositoryImpl implements InsuranceRepository {
  final InsuranceDatasource insuranceDatasource;
  InsuranceRepositoryImpl({required this.insuranceDatasource});
  @override
  Future<Either<Failure, InsuranceEntity>> predictInsurance({
    required InsuranceParams params,
  }) async {
    try {
      final result = await insuranceDatasource.predictInsurance(params: params);
      return right(result.toEntity());
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:machine_learning_x_flutter/data/datasources/startup/startup_datasource.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';
import 'package:machine_learning_x_flutter/data/mapper/startup/startup_model_mapper.dart';
import 'package:machine_learning_x_flutter/domain/entities/startup/startup_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/startup/startup_repository.dart';
import 'package:machine_learning_x_flutter/domain/entities/params/startup/startup_params_entity.dart';

class StartupRepositoriesImpl implements StartupRepository {
  final StartupDatasource startupDatasource;
  const StartupRepositoriesImpl({required this.startupDatasource});
  @override
  Future<Either<Failure, StartupEntity>> predict({
    required PredictStartupParamsEntity params,
  }) async {
    try {
      final result = await startupDatasource.predict(params: params);
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

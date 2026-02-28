import 'package:dartz/dartz.dart';

import 'package:machine_learning_x_flutter/data/datasources/fashion/fashion_datasource.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';
import 'package:machine_learning_x_flutter/data/mapper/fashion/fashion_model_mapper.dart';
import 'package:machine_learning_x_flutter/domain/entities/fashion/fashion_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/fashion/fashion_repository.dart';

class FashionRespositoryImpl implements FashionRepository {
  final FashionDatasource fashionDatasource;
  const FashionRespositoryImpl({required this.fashionDatasource});
  @override
  Future<Either<Failure, FashionEntity>> predict() async {
    try {
      final result = await fashionDatasource.predict();
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

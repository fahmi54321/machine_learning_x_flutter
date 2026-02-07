// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:machine_learning_x_flutter/data/datasources/salaries/salaries_datasources.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';
import 'package:machine_learning_x_flutter/data/mapper/salaries/salaries_model_mapper.dart';
import 'package:machine_learning_x_flutter/domain/entities/salaries/salaries_entity.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/salaries/salaries_repositories.dart';

class SalariesRepositoriesImpl implements SalariesRepositories {
  final SalariesDatasources salariesDatasources;
  SalariesRepositoriesImpl({required this.salariesDatasources});
  @override
  Future<Either<Failure, SalariesEntity>> loadPredict({
    required String val,
  }) async {
    try {
      final result = await salariesDatasources.loadPredictFromApi(val: val);
      return right(result.toEntity());
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}

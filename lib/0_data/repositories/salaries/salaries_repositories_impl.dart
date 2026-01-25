// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:linear_regression_flutter/0_data/datasources/salaries/salaries_datasources.dart';
import 'package:linear_regression_flutter/0_data/exceptions/exceptions.dart';
import 'package:linear_regression_flutter/0_data/mapper/salaries/salaries_model_mapper.dart';
import 'package:linear_regression_flutter/1_domain/entities/salaries/salaries_entity.dart';
import 'package:linear_regression_flutter/1_domain/failures/failures.dart';
import 'package:linear_regression_flutter/1_domain/repositories/salaries/salaries_repositories.dart';

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

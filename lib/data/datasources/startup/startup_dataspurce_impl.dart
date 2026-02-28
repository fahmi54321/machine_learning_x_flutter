import 'package:dio/dio.dart';

import 'package:machine_learning_x_flutter/data/datasources/startup/startup_datasource.dart';
import 'package:machine_learning_x_flutter/data/models/startup/startup_model.dart';
import 'package:machine_learning_x_flutter/data/network/dio_client.dart';
import 'package:machine_learning_x_flutter/domain/entities/params/startup/startup_params_entity.dart';

class StartupDataspurceImpl implements StartupDatasource {
  final DioClient client;
  const StartupDataspurceImpl({required this.client});
  @override
  Future<StartupModel> predict({
    required PredictStartupParamsEntity params,
  }) async {
    final response = await client.dio.post(
      'http://10.0.2.2:5000/predict',
      data: {
        "rd_spend": params.rdSpend,
        "administration": params.administration,
        "marketing_spend": params.marketingSpend,
        "state": params.state,
      },
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    return StartupModel.fromJson(response.data as Map<String, dynamic>);
  }
}

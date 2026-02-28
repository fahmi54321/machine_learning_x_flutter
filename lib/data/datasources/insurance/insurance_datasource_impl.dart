import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:machine_learning_x_flutter/data/datasources/insurance/insurance_datasource.dart';
import 'package:machine_learning_x_flutter/data/models/insurance/insurance_model.dart';
import 'package:machine_learning_x_flutter/data/network/dio_client.dart';
import 'package:machine_learning_x_flutter/domain/entities/params/insurance/startup_params_entity.dart';

class InsuranceDatasourceImpl implements InsuranceDatasource {
  final DioClient client;
  const InsuranceDatasourceImpl({required this.client});
  @override
  Future<InsuranceModel> predictInsurance({
    required InsuranceParamsEntity params,
  }) async {
    final response = await client.dio.post(
      'http://10.0.2.2:5000/predict',
      options: Options(headers: {'Accept': 'application/json'}),
      data: {
        "age": params.age,
        "sex": params.sex,
        "bmi": params.bmi,
        "children": params.children,
        "smoker": params.smoker,
        "region": params.region,
      },
    );

    log('log 2 response: ${response.data}');

    return InsuranceModel.fromJson(response.data as Map<String, dynamic>);
  }
}

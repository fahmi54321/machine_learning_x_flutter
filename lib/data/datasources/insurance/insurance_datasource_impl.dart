// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:machine_learning_x_flutter/data/datasources/insurance/insurance_datasource.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';
import 'package:machine_learning_x_flutter/data/models/insurance/insurance_model.dart';
import 'package:machine_learning_x_flutter/presentation/core/params/insurance/startup_params.dart';

class InsuranceDatasourceImpl implements InsuranceDatasource {
  final http.Client client;
  const InsuranceDatasourceImpl({required this.client});
  @override
  Future<InsuranceModel> predictInsurance({
    required InsuranceParams params,
  }) async {
    final response = await client.post(
      Uri.parse('http://10.0.2.2:5000/predict'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "age": params.age,
        "sex": params.sex,
        "bmi": params.bmi,
        "children": params.children,
        "smoker": params.smoker,
        "region": params.region,
      }),
    );

    debugPrint('responseBody: $response');

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return InsuranceModel.fromJson(responseBody);
    }
  }
}

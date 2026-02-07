import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:machine_learning_x_flutter/data/datasources/startup/startup_datasource.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';
import 'package:machine_learning_x_flutter/data/models/startup/startup_model.dart';
import 'package:machine_learning_x_flutter/application/core/params/startup/startup_params.dart';

class StartupDataspurceImpl implements StartupDatasource {
  final http.Client client;
  const StartupDataspurceImpl({required this.client});
  @override
  Future<StartupModel> predict({required PredictStartupParams params}) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/predict'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "rd_spend": params.rdSpend,
        "administration": params.administration,
        "marketing_spend": params.marketingSpend,
        "state": params.state,
      }),
    );

    debugPrint('responseBody: $response');

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return StartupModel.fromJson(responseBody);
    }
  }
}

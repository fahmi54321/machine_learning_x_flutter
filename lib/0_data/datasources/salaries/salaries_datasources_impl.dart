// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:linear_regression_flutter/0_data/datasources/salaries/salaries_datasources.dart';
import 'package:linear_regression_flutter/0_data/exceptions/exceptions.dart';
import 'package:linear_regression_flutter/0_data/models/salaries/salaries_model.dart';

class SalariesDatasourcesImpl implements SalariesDatasources {
  final http.Client client;
  SalariesDatasourcesImpl({required this.client});
  @override
  Future<SalariesModel> loadPredictFromApi({required String val}) async {
    final response = await client.post(
      Uri.parse('http://10.0.2.2:5000/predict'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'years_experience': val}),
    );

    debugPrint('responseBody: $response');

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      debugPrint('responseBody: $responseBody');
      return SalariesModel.fromJson(responseBody);
    }
  }
}

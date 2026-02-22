import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:machine_learning_x_flutter/data/datasources/fashion/fashion_datasource.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';
import 'package:machine_learning_x_flutter/data/models/fashion/fashion_model.dart';

class FashionDatasourceImpl implements FashionDatasource {
  final http.Client client;
  const FashionDatasourceImpl({required this.client});
  @override
  Future<FashionModel> predict() async {
    final response = await client.get(
      Uri.parse('http://10.0.2.2:5000/predict'),
      headers: {'Content-Type': 'application/json'},
    );

    debugPrint('responseBody: $response');

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return FashionModel.fromJson(responseBody);
    }
  }
}

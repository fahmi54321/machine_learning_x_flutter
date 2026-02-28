import 'package:dio/dio.dart';

import 'package:machine_learning_x_flutter/data/datasources/fashion/fashion_datasource.dart';
import 'package:machine_learning_x_flutter/data/models/fashion/fashion_model.dart';
import 'package:machine_learning_x_flutter/data/network/dio_client.dart';

class FashionDatasourceImpl implements FashionDatasource {
  final DioClient client;
  const FashionDatasourceImpl({required this.client});
  @override
  Future<FashionModel> predict() async {
    final response = await client.dio.get(
      'http://10.0.2.2:5000/predict',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    return FashionModel.fromJson(response.data as Map<String, dynamic>);
  }
}

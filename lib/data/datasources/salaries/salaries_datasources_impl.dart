import 'package:dio/dio.dart';

import 'package:machine_learning_x_flutter/data/datasources/salaries/salaries_datasources.dart';
import 'package:machine_learning_x_flutter/data/models/salaries/salaries_model.dart';
import 'package:machine_learning_x_flutter/data/network/dio_client.dart';

class SalariesDatasourcesImpl implements SalariesDatasources {
  final DioClient client;
  const SalariesDatasourcesImpl({required this.client});
  @override
  Future<SalariesModel> loadPredictFromApi({required String val}) async {
    final response = await client.dio.post(
      'http://10.0.2.2:5000/predict',
      options: Options(headers: {'Content-Type': 'application/json'}),
      data: {'years_experience': val},
    );

    return SalariesModel.fromJson(response.data as Map<String, dynamic>);
  }
}

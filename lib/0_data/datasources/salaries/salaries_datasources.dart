import 'package:linear_regression_flutter/0_data/models/salaries/salaries_model.dart';

abstract class SalariesDatasources {
  Future<SalariesModel> loadPredictFromApi({required String val});
}

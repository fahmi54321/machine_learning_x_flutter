import 'package:machine_learning_x_flutter/data/models/insurance/insurance_model.dart';
import 'package:machine_learning_x_flutter/presentation/core/params/insurance/startup_params.dart';

abstract class InsuranceDatasource {
  Future<InsuranceModel> predictInsurance({required InsuranceParams params});
}

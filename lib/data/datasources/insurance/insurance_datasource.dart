import 'package:machine_learning_x_flutter/data/models/insurance/insurance_model.dart';
import 'package:machine_learning_x_flutter/domain/entities/params/insurance/startup_params_entity.dart';

abstract class InsuranceDatasource {
  Future<InsuranceModel> predictInsurance({
    required InsuranceParamsEntity params,
  });
}

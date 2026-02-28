import 'package:machine_learning_x_flutter/data/models/startup/startup_model.dart';
import 'package:machine_learning_x_flutter/domain/entities/params/startup/startup_params_entity.dart';

abstract class StartupDatasource {
  Future<StartupModel> predict({required PredictStartupParamsEntity params});
}

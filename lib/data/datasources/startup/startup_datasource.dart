import 'package:machine_learning_x_flutter/data/models/startup/startup_model.dart';
import 'package:machine_learning_x_flutter/presentation/core/params/startup/startup_params.dart';

abstract class StartupDatasource {
  Future<StartupModel> predict({required PredictStartupParams params});
}

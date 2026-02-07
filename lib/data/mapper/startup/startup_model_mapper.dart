import 'package:machine_learning_x_flutter/data/models/startup/startup_model.dart';
import 'package:machine_learning_x_flutter/domain/entities/startup/startup_entity.dart';

extension StartupModelMapper on StartupModel {
  StartupEntity toEntity() {
    return StartupEntity(
      classification: classification,
      description: description,
      predictedProfit: predictedProfit,
      recommendation: recommendation,
    );
  }
}

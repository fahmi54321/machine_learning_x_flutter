import 'package:machine_learning_x_flutter/data/models/salaries/salaries_model.dart';
import 'package:machine_learning_x_flutter/domain/entities/prediction/prediction_entity.dart';
import 'package:machine_learning_x_flutter/domain/entities/salaries/salaries_entity.dart';
import 'package:machine_learning_x_flutter/domain/entities/visualization/visualization_entity.dart';

extension SalariesModelMapper on SalariesModel {
  SalariesEntity toEntity() {
    return SalariesEntity(
      explanation: explanation,
      predictionEntity: prediction == null
          ? null
          : PredictionEntity(
              currency: prediction!.currency,
              salary: prediction!.salary,
            ),
      visualization: visualization == null
          ? null
          : VisualizationEntity(imageBase64: visualization!.imageBase64),
    );
  }
}

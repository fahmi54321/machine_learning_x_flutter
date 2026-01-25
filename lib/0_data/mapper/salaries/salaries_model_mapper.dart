import 'package:linear_regression_flutter/0_data/models/salaries/salaries_model.dart';
import 'package:linear_regression_flutter/1_domain/entities/prediction/prediction_entity.dart';
import 'package:linear_regression_flutter/1_domain/entities/salaries/salaries_entity.dart';
import 'package:linear_regression_flutter/1_domain/entities/visualization/visualization_entity.dart';

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

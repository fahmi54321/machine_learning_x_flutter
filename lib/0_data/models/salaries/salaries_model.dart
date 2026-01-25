import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linear_regression_flutter/0_data/models/model_info/model_info_model.dart';
import 'package:linear_regression_flutter/0_data/models/prediction/prediction_model.dart';
import 'package:linear_regression_flutter/0_data/models/visualization/visualization_model.dart';

part 'salaries_model.g.dart';

part 'salaries_model.freezed.dart';

@freezed
class SalariesModel with _$SalariesModel {
  const SalariesModel._();

  const factory SalariesModel({
    @JsonKey(name: 'explanation', defaultValue: '') required String explanation,
    @JsonKey(name: 'model_info') ModelInfoModel? modelInfo,
    @JsonKey(name: 'prediction') PredictionModel? prediction,
    @JsonKey(name: 'visualization') VisualizationModel? visualization,
  }) = _SalariesModel;

  factory SalariesModel.fromJson(Map<String, dynamic> json) =>
      _$SalariesModelFromJson(json);
}

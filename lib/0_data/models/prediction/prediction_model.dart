import 'package:freezed_annotation/freezed_annotation.dart';

part 'prediction_model.g.dart';

part 'prediction_model.freezed.dart';

@freezed
class PredictionModel with _$PredictionModel {
  const PredictionModel._();

  const factory PredictionModel({
    @JsonKey(name: 'currency', defaultValue: '') required String currency,
    @JsonKey(name: 'salary', defaultValue: 0) required double salary,
  }) = _PredictionModel;

  factory PredictionModel.fromJson(Map<String, dynamic> json) =>
      _$PredictionModelFromJson(json);
}

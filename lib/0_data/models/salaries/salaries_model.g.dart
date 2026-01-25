// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salaries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalariesModelImpl _$$SalariesModelImplFromJson(Map<String, dynamic> json) =>
    _$SalariesModelImpl(
      explanation: json['explanation'] as String? ?? '',
      modelInfo: json['model_info'] == null
          ? null
          : ModelInfoModel.fromJson(json['model_info'] as Map<String, dynamic>),
      prediction: json['prediction'] == null
          ? null
          : PredictionModel.fromJson(
              json['prediction'] as Map<String, dynamic>,
            ),
      visualization: json['visualization'] == null
          ? null
          : VisualizationModel.fromJson(
              json['visualization'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$SalariesModelImplToJson(_$SalariesModelImpl instance) =>
    <String, dynamic>{
      'explanation': instance.explanation,
      'model_info': instance.modelInfo,
      'prediction': instance.prediction,
      'visualization': instance.visualization,
    };

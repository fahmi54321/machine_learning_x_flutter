// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodModelImpl _$$FoodModelImplFromJson(Map<String, dynamic> json) =>
    _$FoodModelImpl(
      description: json['description'] as String? ?? '',
      imageBase64: json['image_base64'] as String? ?? '',
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0,
      prediction: json['prediction'] as String? ?? '',
      trueLabel: json['true_label'] as String? ?? '',
    );

Map<String, dynamic> _$$FoodModelImplToJson(_$FoodModelImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'image_base64': instance.imageBase64,
      'confidence': instance.confidence,
      'prediction': instance.prediction,
      'true_label': instance.trueLabel,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartupModelImpl _$$StartupModelImplFromJson(Map<String, dynamic> json) =>
    _$StartupModelImpl(
      classification: json['classification'] as String? ?? '',
      description: json['description'] as String? ?? '',
      recommendation:
          (json['recommendation'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      predictedProfit: (json['predicted_profit'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$StartupModelImplToJson(_$StartupModelImpl instance) =>
    <String, dynamic>{
      'classification': instance.classification,
      'description': instance.description,
      'recommendation': instance.recommendation,
      'predicted_profit': instance.predictedProfit,
    };

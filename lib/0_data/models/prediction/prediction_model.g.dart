// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictionModelImpl _$$PredictionModelImplFromJson(
  Map<String, dynamic> json,
) => _$PredictionModelImpl(
  currency: json['currency'] as String? ?? '',
  salary: (json['salary'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$$PredictionModelImplToJson(
  _$PredictionModelImpl instance,
) => <String, dynamic>{
  'currency': instance.currency,
  'salary': instance.salary,
};

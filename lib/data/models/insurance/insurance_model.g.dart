// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsuranceModelImpl _$$InsuranceModelImplFromJson(Map<String, dynamic> json) =>
    _$InsuranceModelImpl(
      description: json['description'] as String? ?? '',
      predictedCharges: (json['predicted_charges'] as num?)?.toDouble() ?? 0,
      riskCategory: json['risk_category'] as String? ?? '',
    );

Map<String, dynamic> _$$InsuranceModelImplToJson(
  _$InsuranceModelImpl instance,
) => <String, dynamic>{
  'description': instance.description,
  'predicted_charges': instance.predictedCharges,
  'risk_category': instance.riskCategory,
};

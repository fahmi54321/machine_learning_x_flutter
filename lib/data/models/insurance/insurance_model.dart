import 'package:freezed_annotation/freezed_annotation.dart';

part 'insurance_model.g.dart';

part 'insurance_model.freezed.dart';

@freezed
class InsuranceModel with _$InsuranceModel {
  const InsuranceModel._();

  const factory InsuranceModel({
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'predicted_charges', defaultValue: 0)
    required double predictedCharges,
    @JsonKey(name: 'risk_category', defaultValue: '')
    required String riskCategory,
  }) = _InsuranceModel;

  factory InsuranceModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceModelFromJson(json);
}

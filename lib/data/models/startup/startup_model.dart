import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_model.g.dart';

part 'startup_model.freezed.dart';

@freezed
class StartupModel with _$StartupModel {
  const StartupModel._();

  const factory StartupModel({
    @JsonKey(name: 'classification', defaultValue: '')
    required String classification,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'recommendation', defaultValue: [])
    required List<String> recommendation,
    @JsonKey(name: 'predicted_profit', defaultValue: 0)
    required double predictedProfit,
  }) = _StartupModel;

  factory StartupModel.fromJson(Map<String, dynamic> json) =>
      _$StartupModelFromJson(json);
}

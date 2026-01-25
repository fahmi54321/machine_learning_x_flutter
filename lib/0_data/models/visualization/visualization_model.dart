import 'package:freezed_annotation/freezed_annotation.dart';

part 'visualization_model.g.dart';

part 'visualization_model.freezed.dart';

@freezed
class VisualizationModel with _$VisualizationModel {
  const VisualizationModel._();

  const factory VisualizationModel({
    @JsonKey(name: 'image_base64', defaultValue: '')
    required String imageBase64,
  }) = _VisualizationModel;

  factory VisualizationModel.fromJson(Map<String, dynamic> json) =>
      _$VisualizationModelFromJson(json);
}

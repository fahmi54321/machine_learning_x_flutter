import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_info_model.g.dart';

part 'model_info_model.freezed.dart';

@freezed
class ModelInfoModel with _$ModelInfoModel {
  const ModelInfoModel._();

  const factory ModelInfoModel({
    @JsonKey(name: 'library', defaultValue: '') required String library,
    @JsonKey(name: 'type', defaultValue: '') required String type,
  }) = _ModelInfoModel;

  factory ModelInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ModelInfoModelFromJson(json);
}

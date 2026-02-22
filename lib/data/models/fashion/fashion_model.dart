import 'package:freezed_annotation/freezed_annotation.dart';

part 'fashion_model.g.dart';

part 'fashion_model.freezed.dart';

@freezed
class FashionModel with _$FashionModel {
  const FashionModel._();

  const factory FashionModel({
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'image_base64', defaultValue: '')
    required String imageBase64,
    @JsonKey(name: 'confidence', defaultValue: 0) required double confidence,
    @JsonKey(name: 'prediction', defaultValue: '') required String prediction,
    @JsonKey(name: 'true_label', defaultValue: '') required String trueLabel,
  }) = _FashionModel;

  factory FashionModel.fromJson(Map<String, dynamic> json) =>
      _$FashionModelFromJson(json);
}

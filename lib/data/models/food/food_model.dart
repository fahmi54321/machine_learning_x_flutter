import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_model.g.dart';

part 'food_model.freezed.dart';

@freezed
class FoodModel with _$FoodModel {
  const FoodModel._();

  const factory FoodModel({
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'image_base64', defaultValue: '')
    required String imageBase64,
    @JsonKey(name: 'confidence', defaultValue: 0) required double confidence,
    @JsonKey(name: 'prediction', defaultValue: '') required String prediction,
    @JsonKey(name: 'true_label', defaultValue: '') required String trueLabel,
  }) = _FoodModel;

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
}

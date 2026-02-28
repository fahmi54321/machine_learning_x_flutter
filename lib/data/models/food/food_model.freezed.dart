// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) {
  return _FoodModel.fromJson(json);
}

/// @nodoc
mixin _$FoodModel {
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_base64', defaultValue: '')
  String get imageBase64 => throw _privateConstructorUsedError;
  @JsonKey(name: 'confidence', defaultValue: 0)
  double get confidence => throw _privateConstructorUsedError;
  @JsonKey(name: 'prediction', defaultValue: '')
  String get prediction => throw _privateConstructorUsedError;
  @JsonKey(name: 'true_label', defaultValue: '')
  String get trueLabel => throw _privateConstructorUsedError;

  /// Serializes this FoodModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodModelCopyWith<FoodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodModelCopyWith<$Res> {
  factory $FoodModelCopyWith(FoodModel value, $Res Function(FoodModel) then) =
      _$FoodModelCopyWithImpl<$Res, FoodModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'description', defaultValue: '') String description,
    @JsonKey(name: 'image_base64', defaultValue: '') String imageBase64,
    @JsonKey(name: 'confidence', defaultValue: 0) double confidence,
    @JsonKey(name: 'prediction', defaultValue: '') String prediction,
    @JsonKey(name: 'true_label', defaultValue: '') String trueLabel,
  });
}

/// @nodoc
class _$FoodModelCopyWithImpl<$Res, $Val extends FoodModel>
    implements $FoodModelCopyWith<$Res> {
  _$FoodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? imageBase64 = null,
    Object? confidence = null,
    Object? prediction = null,
    Object? trueLabel = null,
  }) {
    return _then(
      _value.copyWith(
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            imageBase64: null == imageBase64
                ? _value.imageBase64
                : imageBase64 // ignore: cast_nullable_to_non_nullable
                      as String,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
            prediction: null == prediction
                ? _value.prediction
                : prediction // ignore: cast_nullable_to_non_nullable
                      as String,
            trueLabel: null == trueLabel
                ? _value.trueLabel
                : trueLabel // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FoodModelImplCopyWith<$Res>
    implements $FoodModelCopyWith<$Res> {
  factory _$$FoodModelImplCopyWith(
    _$FoodModelImpl value,
    $Res Function(_$FoodModelImpl) then,
  ) = __$$FoodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'description', defaultValue: '') String description,
    @JsonKey(name: 'image_base64', defaultValue: '') String imageBase64,
    @JsonKey(name: 'confidence', defaultValue: 0) double confidence,
    @JsonKey(name: 'prediction', defaultValue: '') String prediction,
    @JsonKey(name: 'true_label', defaultValue: '') String trueLabel,
  });
}

/// @nodoc
class __$$FoodModelImplCopyWithImpl<$Res>
    extends _$FoodModelCopyWithImpl<$Res, _$FoodModelImpl>
    implements _$$FoodModelImplCopyWith<$Res> {
  __$$FoodModelImplCopyWithImpl(
    _$FoodModelImpl _value,
    $Res Function(_$FoodModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FoodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? imageBase64 = null,
    Object? confidence = null,
    Object? prediction = null,
    Object? trueLabel = null,
  }) {
    return _then(
      _$FoodModelImpl(
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        imageBase64: null == imageBase64
            ? _value.imageBase64
            : imageBase64 // ignore: cast_nullable_to_non_nullable
                  as String,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
        prediction: null == prediction
            ? _value.prediction
            : prediction // ignore: cast_nullable_to_non_nullable
                  as String,
        trueLabel: null == trueLabel
            ? _value.trueLabel
            : trueLabel // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodModelImpl extends _FoodModel {
  const _$FoodModelImpl({
    @JsonKey(name: 'description', defaultValue: '') required this.description,
    @JsonKey(name: 'image_base64', defaultValue: '') required this.imageBase64,
    @JsonKey(name: 'confidence', defaultValue: 0) required this.confidence,
    @JsonKey(name: 'prediction', defaultValue: '') required this.prediction,
    @JsonKey(name: 'true_label', defaultValue: '') required this.trueLabel,
  }) : super._();

  factory _$FoodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodModelImplFromJson(json);

  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'image_base64', defaultValue: '')
  final String imageBase64;
  @override
  @JsonKey(name: 'confidence', defaultValue: 0)
  final double confidence;
  @override
  @JsonKey(name: 'prediction', defaultValue: '')
  final String prediction;
  @override
  @JsonKey(name: 'true_label', defaultValue: '')
  final String trueLabel;

  @override
  String toString() {
    return 'FoodModel(description: $description, imageBase64: $imageBase64, confidence: $confidence, prediction: $prediction, trueLabel: $trueLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodModelImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageBase64, imageBase64) ||
                other.imageBase64 == imageBase64) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            (identical(other.trueLabel, trueLabel) ||
                other.trueLabel == trueLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    description,
    imageBase64,
    confidence,
    prediction,
    trueLabel,
  );

  /// Create a copy of FoodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodModelImplCopyWith<_$FoodModelImpl> get copyWith =>
      __$$FoodModelImplCopyWithImpl<_$FoodModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodModelImplToJson(this);
  }
}

abstract class _FoodModel extends FoodModel {
  const factory _FoodModel({
    @JsonKey(name: 'description', defaultValue: '')
    required final String description,
    @JsonKey(name: 'image_base64', defaultValue: '')
    required final String imageBase64,
    @JsonKey(name: 'confidence', defaultValue: 0)
    required final double confidence,
    @JsonKey(name: 'prediction', defaultValue: '')
    required final String prediction,
    @JsonKey(name: 'true_label', defaultValue: '')
    required final String trueLabel,
  }) = _$FoodModelImpl;
  const _FoodModel._() : super._();

  factory _FoodModel.fromJson(Map<String, dynamic> json) =
      _$FoodModelImpl.fromJson;

  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'image_base64', defaultValue: '')
  String get imageBase64;
  @override
  @JsonKey(name: 'confidence', defaultValue: 0)
  double get confidence;
  @override
  @JsonKey(name: 'prediction', defaultValue: '')
  String get prediction;
  @override
  @JsonKey(name: 'true_label', defaultValue: '')
  String get trueLabel;

  /// Create a copy of FoodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodModelImplCopyWith<_$FoodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

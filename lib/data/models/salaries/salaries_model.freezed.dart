// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salaries_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SalariesModel _$SalariesModelFromJson(Map<String, dynamic> json) {
  return _SalariesModel.fromJson(json);
}

/// @nodoc
mixin _$SalariesModel {
  @JsonKey(name: 'explanation', defaultValue: '')
  String get explanation => throw _privateConstructorUsedError;
  @JsonKey(name: 'model_info')
  ModelInfoModel? get modelInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'prediction')
  PredictionModel? get prediction => throw _privateConstructorUsedError;
  @JsonKey(name: 'visualization')
  VisualizationModel? get visualization => throw _privateConstructorUsedError;

  /// Serializes this SalariesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalariesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalariesModelCopyWith<SalariesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalariesModelCopyWith<$Res> {
  factory $SalariesModelCopyWith(
    SalariesModel value,
    $Res Function(SalariesModel) then,
  ) = _$SalariesModelCopyWithImpl<$Res, SalariesModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'explanation', defaultValue: '') String explanation,
    @JsonKey(name: 'model_info') ModelInfoModel? modelInfo,
    @JsonKey(name: 'prediction') PredictionModel? prediction,
    @JsonKey(name: 'visualization') VisualizationModel? visualization,
  });

  $ModelInfoModelCopyWith<$Res>? get modelInfo;
  $PredictionModelCopyWith<$Res>? get prediction;
  $VisualizationModelCopyWith<$Res>? get visualization;
}

/// @nodoc
class _$SalariesModelCopyWithImpl<$Res, $Val extends SalariesModel>
    implements $SalariesModelCopyWith<$Res> {
  _$SalariesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalariesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? explanation = null,
    Object? modelInfo = freezed,
    Object? prediction = freezed,
    Object? visualization = freezed,
  }) {
    return _then(
      _value.copyWith(
            explanation: null == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as String,
            modelInfo: freezed == modelInfo
                ? _value.modelInfo
                : modelInfo // ignore: cast_nullable_to_non_nullable
                      as ModelInfoModel?,
            prediction: freezed == prediction
                ? _value.prediction
                : prediction // ignore: cast_nullable_to_non_nullable
                      as PredictionModel?,
            visualization: freezed == visualization
                ? _value.visualization
                : visualization // ignore: cast_nullable_to_non_nullable
                      as VisualizationModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of SalariesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModelInfoModelCopyWith<$Res>? get modelInfo {
    if (_value.modelInfo == null) {
      return null;
    }

    return $ModelInfoModelCopyWith<$Res>(_value.modelInfo!, (value) {
      return _then(_value.copyWith(modelInfo: value) as $Val);
    });
  }

  /// Create a copy of SalariesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionModelCopyWith<$Res>? get prediction {
    if (_value.prediction == null) {
      return null;
    }

    return $PredictionModelCopyWith<$Res>(_value.prediction!, (value) {
      return _then(_value.copyWith(prediction: value) as $Val);
    });
  }

  /// Create a copy of SalariesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VisualizationModelCopyWith<$Res>? get visualization {
    if (_value.visualization == null) {
      return null;
    }

    return $VisualizationModelCopyWith<$Res>(_value.visualization!, (value) {
      return _then(_value.copyWith(visualization: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalariesModelImplCopyWith<$Res>
    implements $SalariesModelCopyWith<$Res> {
  factory _$$SalariesModelImplCopyWith(
    _$SalariesModelImpl value,
    $Res Function(_$SalariesModelImpl) then,
  ) = __$$SalariesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'explanation', defaultValue: '') String explanation,
    @JsonKey(name: 'model_info') ModelInfoModel? modelInfo,
    @JsonKey(name: 'prediction') PredictionModel? prediction,
    @JsonKey(name: 'visualization') VisualizationModel? visualization,
  });

  @override
  $ModelInfoModelCopyWith<$Res>? get modelInfo;
  @override
  $PredictionModelCopyWith<$Res>? get prediction;
  @override
  $VisualizationModelCopyWith<$Res>? get visualization;
}

/// @nodoc
class __$$SalariesModelImplCopyWithImpl<$Res>
    extends _$SalariesModelCopyWithImpl<$Res, _$SalariesModelImpl>
    implements _$$SalariesModelImplCopyWith<$Res> {
  __$$SalariesModelImplCopyWithImpl(
    _$SalariesModelImpl _value,
    $Res Function(_$SalariesModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SalariesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? explanation = null,
    Object? modelInfo = freezed,
    Object? prediction = freezed,
    Object? visualization = freezed,
  }) {
    return _then(
      _$SalariesModelImpl(
        explanation: null == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as String,
        modelInfo: freezed == modelInfo
            ? _value.modelInfo
            : modelInfo // ignore: cast_nullable_to_non_nullable
                  as ModelInfoModel?,
        prediction: freezed == prediction
            ? _value.prediction
            : prediction // ignore: cast_nullable_to_non_nullable
                  as PredictionModel?,
        visualization: freezed == visualization
            ? _value.visualization
            : visualization // ignore: cast_nullable_to_non_nullable
                  as VisualizationModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SalariesModelImpl extends _SalariesModel {
  const _$SalariesModelImpl({
    @JsonKey(name: 'explanation', defaultValue: '') required this.explanation,
    @JsonKey(name: 'model_info') this.modelInfo,
    @JsonKey(name: 'prediction') this.prediction,
    @JsonKey(name: 'visualization') this.visualization,
  }) : super._();

  factory _$SalariesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalariesModelImplFromJson(json);

  @override
  @JsonKey(name: 'explanation', defaultValue: '')
  final String explanation;
  @override
  @JsonKey(name: 'model_info')
  final ModelInfoModel? modelInfo;
  @override
  @JsonKey(name: 'prediction')
  final PredictionModel? prediction;
  @override
  @JsonKey(name: 'visualization')
  final VisualizationModel? visualization;

  @override
  String toString() {
    return 'SalariesModel(explanation: $explanation, modelInfo: $modelInfo, prediction: $prediction, visualization: $visualization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalariesModelImpl &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.modelInfo, modelInfo) ||
                other.modelInfo == modelInfo) &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            (identical(other.visualization, visualization) ||
                other.visualization == visualization));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    explanation,
    modelInfo,
    prediction,
    visualization,
  );

  /// Create a copy of SalariesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalariesModelImplCopyWith<_$SalariesModelImpl> get copyWith =>
      __$$SalariesModelImplCopyWithImpl<_$SalariesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalariesModelImplToJson(this);
  }
}

abstract class _SalariesModel extends SalariesModel {
  const factory _SalariesModel({
    @JsonKey(name: 'explanation', defaultValue: '')
    required final String explanation,
    @JsonKey(name: 'model_info') final ModelInfoModel? modelInfo,
    @JsonKey(name: 'prediction') final PredictionModel? prediction,
    @JsonKey(name: 'visualization') final VisualizationModel? visualization,
  }) = _$SalariesModelImpl;
  const _SalariesModel._() : super._();

  factory _SalariesModel.fromJson(Map<String, dynamic> json) =
      _$SalariesModelImpl.fromJson;

  @override
  @JsonKey(name: 'explanation', defaultValue: '')
  String get explanation;
  @override
  @JsonKey(name: 'model_info')
  ModelInfoModel? get modelInfo;
  @override
  @JsonKey(name: 'prediction')
  PredictionModel? get prediction;
  @override
  @JsonKey(name: 'visualization')
  VisualizationModel? get visualization;

  /// Create a copy of SalariesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalariesModelImplCopyWith<_$SalariesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

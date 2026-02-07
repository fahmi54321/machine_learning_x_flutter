// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StartupModel _$StartupModelFromJson(Map<String, dynamic> json) {
  return _StartupModel.fromJson(json);
}

/// @nodoc
mixin _$StartupModel {
  @JsonKey(name: 'classification', defaultValue: '')
  String get classification => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'recommendation', defaultValue: [])
  List<String> get recommendation => throw _privateConstructorUsedError;
  @JsonKey(name: 'predicted_profit', defaultValue: 0)
  double get predictedProfit => throw _privateConstructorUsedError;

  /// Serializes this StartupModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StartupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartupModelCopyWith<StartupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupModelCopyWith<$Res> {
  factory $StartupModelCopyWith(
    StartupModel value,
    $Res Function(StartupModel) then,
  ) = _$StartupModelCopyWithImpl<$Res, StartupModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'classification', defaultValue: '') String classification,
    @JsonKey(name: 'description', defaultValue: '') String description,
    @JsonKey(name: 'recommendation', defaultValue: [])
    List<String> recommendation,
    @JsonKey(name: 'predicted_profit', defaultValue: 0) double predictedProfit,
  });
}

/// @nodoc
class _$StartupModelCopyWithImpl<$Res, $Val extends StartupModel>
    implements $StartupModelCopyWith<$Res> {
  _$StartupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classification = null,
    Object? description = null,
    Object? recommendation = null,
    Object? predictedProfit = null,
  }) {
    return _then(
      _value.copyWith(
            classification: null == classification
                ? _value.classification
                : classification // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            recommendation: null == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            predictedProfit: null == predictedProfit
                ? _value.predictedProfit
                : predictedProfit // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StartupModelImplCopyWith<$Res>
    implements $StartupModelCopyWith<$Res> {
  factory _$$StartupModelImplCopyWith(
    _$StartupModelImpl value,
    $Res Function(_$StartupModelImpl) then,
  ) = __$$StartupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'classification', defaultValue: '') String classification,
    @JsonKey(name: 'description', defaultValue: '') String description,
    @JsonKey(name: 'recommendation', defaultValue: [])
    List<String> recommendation,
    @JsonKey(name: 'predicted_profit', defaultValue: 0) double predictedProfit,
  });
}

/// @nodoc
class __$$StartupModelImplCopyWithImpl<$Res>
    extends _$StartupModelCopyWithImpl<$Res, _$StartupModelImpl>
    implements _$$StartupModelImplCopyWith<$Res> {
  __$$StartupModelImplCopyWithImpl(
    _$StartupModelImpl _value,
    $Res Function(_$StartupModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StartupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classification = null,
    Object? description = null,
    Object? recommendation = null,
    Object? predictedProfit = null,
  }) {
    return _then(
      _$StartupModelImpl(
        classification: null == classification
            ? _value.classification
            : classification // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        recommendation: null == recommendation
            ? _value._recommendation
            : recommendation // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        predictedProfit: null == predictedProfit
            ? _value.predictedProfit
            : predictedProfit // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StartupModelImpl extends _StartupModel {
  const _$StartupModelImpl({
    @JsonKey(name: 'classification', defaultValue: '')
    required this.classification,
    @JsonKey(name: 'description', defaultValue: '') required this.description,
    @JsonKey(name: 'recommendation', defaultValue: [])
    required final List<String> recommendation,
    @JsonKey(name: 'predicted_profit', defaultValue: 0)
    required this.predictedProfit,
  }) : _recommendation = recommendation,
       super._();

  factory _$StartupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartupModelImplFromJson(json);

  @override
  @JsonKey(name: 'classification', defaultValue: '')
  final String classification;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  final List<String> _recommendation;
  @override
  @JsonKey(name: 'recommendation', defaultValue: [])
  List<String> get recommendation {
    if (_recommendation is EqualUnmodifiableListView) return _recommendation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendation);
  }

  @override
  @JsonKey(name: 'predicted_profit', defaultValue: 0)
  final double predictedProfit;

  @override
  String toString() {
    return 'StartupModel(classification: $classification, description: $description, recommendation: $recommendation, predictedProfit: $predictedProfit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartupModelImpl &&
            (identical(other.classification, classification) ||
                other.classification == classification) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._recommendation,
              _recommendation,
            ) &&
            (identical(other.predictedProfit, predictedProfit) ||
                other.predictedProfit == predictedProfit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    classification,
    description,
    const DeepCollectionEquality().hash(_recommendation),
    predictedProfit,
  );

  /// Create a copy of StartupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartupModelImplCopyWith<_$StartupModelImpl> get copyWith =>
      __$$StartupModelImplCopyWithImpl<_$StartupModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartupModelImplToJson(this);
  }
}

abstract class _StartupModel extends StartupModel {
  const factory _StartupModel({
    @JsonKey(name: 'classification', defaultValue: '')
    required final String classification,
    @JsonKey(name: 'description', defaultValue: '')
    required final String description,
    @JsonKey(name: 'recommendation', defaultValue: [])
    required final List<String> recommendation,
    @JsonKey(name: 'predicted_profit', defaultValue: 0)
    required final double predictedProfit,
  }) = _$StartupModelImpl;
  const _StartupModel._() : super._();

  factory _StartupModel.fromJson(Map<String, dynamic> json) =
      _$StartupModelImpl.fromJson;

  @override
  @JsonKey(name: 'classification', defaultValue: '')
  String get classification;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'recommendation', defaultValue: [])
  List<String> get recommendation;
  @override
  @JsonKey(name: 'predicted_profit', defaultValue: 0)
  double get predictedProfit;

  /// Create a copy of StartupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartupModelImplCopyWith<_$StartupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

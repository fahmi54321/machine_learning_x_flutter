// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insurance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InsuranceModel _$InsuranceModelFromJson(Map<String, dynamic> json) {
  return _InsuranceModel.fromJson(json);
}

/// @nodoc
mixin _$InsuranceModel {
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'predicted_charges', defaultValue: 0)
  double get predictedCharges => throw _privateConstructorUsedError;
  @JsonKey(name: 'risk_category', defaultValue: '')
  String get riskCategory => throw _privateConstructorUsedError;

  /// Serializes this InsuranceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InsuranceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InsuranceModelCopyWith<InsuranceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsuranceModelCopyWith<$Res> {
  factory $InsuranceModelCopyWith(
    InsuranceModel value,
    $Res Function(InsuranceModel) then,
  ) = _$InsuranceModelCopyWithImpl<$Res, InsuranceModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'description', defaultValue: '') String description,
    @JsonKey(name: 'predicted_charges', defaultValue: 0)
    double predictedCharges,
    @JsonKey(name: 'risk_category', defaultValue: '') String riskCategory,
  });
}

/// @nodoc
class _$InsuranceModelCopyWithImpl<$Res, $Val extends InsuranceModel>
    implements $InsuranceModelCopyWith<$Res> {
  _$InsuranceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InsuranceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? predictedCharges = null,
    Object? riskCategory = null,
  }) {
    return _then(
      _value.copyWith(
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            predictedCharges: null == predictedCharges
                ? _value.predictedCharges
                : predictedCharges // ignore: cast_nullable_to_non_nullable
                      as double,
            riskCategory: null == riskCategory
                ? _value.riskCategory
                : riskCategory // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InsuranceModelImplCopyWith<$Res>
    implements $InsuranceModelCopyWith<$Res> {
  factory _$$InsuranceModelImplCopyWith(
    _$InsuranceModelImpl value,
    $Res Function(_$InsuranceModelImpl) then,
  ) = __$$InsuranceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'description', defaultValue: '') String description,
    @JsonKey(name: 'predicted_charges', defaultValue: 0)
    double predictedCharges,
    @JsonKey(name: 'risk_category', defaultValue: '') String riskCategory,
  });
}

/// @nodoc
class __$$InsuranceModelImplCopyWithImpl<$Res>
    extends _$InsuranceModelCopyWithImpl<$Res, _$InsuranceModelImpl>
    implements _$$InsuranceModelImplCopyWith<$Res> {
  __$$InsuranceModelImplCopyWithImpl(
    _$InsuranceModelImpl _value,
    $Res Function(_$InsuranceModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InsuranceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? predictedCharges = null,
    Object? riskCategory = null,
  }) {
    return _then(
      _$InsuranceModelImpl(
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        predictedCharges: null == predictedCharges
            ? _value.predictedCharges
            : predictedCharges // ignore: cast_nullable_to_non_nullable
                  as double,
        riskCategory: null == riskCategory
            ? _value.riskCategory
            : riskCategory // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InsuranceModelImpl extends _InsuranceModel {
  const _$InsuranceModelImpl({
    @JsonKey(name: 'description', defaultValue: '') required this.description,
    @JsonKey(name: 'predicted_charges', defaultValue: 0)
    required this.predictedCharges,
    @JsonKey(name: 'risk_category', defaultValue: '')
    required this.riskCategory,
  }) : super._();

  factory _$InsuranceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsuranceModelImplFromJson(json);

  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'predicted_charges', defaultValue: 0)
  final double predictedCharges;
  @override
  @JsonKey(name: 'risk_category', defaultValue: '')
  final String riskCategory;

  @override
  String toString() {
    return 'InsuranceModel(description: $description, predictedCharges: $predictedCharges, riskCategory: $riskCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsuranceModelImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.predictedCharges, predictedCharges) ||
                other.predictedCharges == predictedCharges) &&
            (identical(other.riskCategory, riskCategory) ||
                other.riskCategory == riskCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, description, predictedCharges, riskCategory);

  /// Create a copy of InsuranceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InsuranceModelImplCopyWith<_$InsuranceModelImpl> get copyWith =>
      __$$InsuranceModelImplCopyWithImpl<_$InsuranceModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InsuranceModelImplToJson(this);
  }
}

abstract class _InsuranceModel extends InsuranceModel {
  const factory _InsuranceModel({
    @JsonKey(name: 'description', defaultValue: '')
    required final String description,
    @JsonKey(name: 'predicted_charges', defaultValue: 0)
    required final double predictedCharges,
    @JsonKey(name: 'risk_category', defaultValue: '')
    required final String riskCategory,
  }) = _$InsuranceModelImpl;
  const _InsuranceModel._() : super._();

  factory _InsuranceModel.fromJson(Map<String, dynamic> json) =
      _$InsuranceModelImpl.fromJson;

  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'predicted_charges', defaultValue: 0)
  double get predictedCharges;
  @override
  @JsonKey(name: 'risk_category', defaultValue: '')
  String get riskCategory;

  /// Create a copy of InsuranceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InsuranceModelImplCopyWith<_$InsuranceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prediction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PredictionModel _$PredictionModelFromJson(Map<String, dynamic> json) {
  return _PredictionModel.fromJson(json);
}

/// @nodoc
mixin _$PredictionModel {
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'salary', defaultValue: 0)
  double get salary => throw _privateConstructorUsedError;

  /// Serializes this PredictionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PredictionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PredictionModelCopyWith<PredictionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionModelCopyWith<$Res> {
  factory $PredictionModelCopyWith(
    PredictionModel value,
    $Res Function(PredictionModel) then,
  ) = _$PredictionModelCopyWithImpl<$Res, PredictionModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'currency', defaultValue: '') String currency,
    @JsonKey(name: 'salary', defaultValue: 0) double salary,
  });
}

/// @nodoc
class _$PredictionModelCopyWithImpl<$Res, $Val extends PredictionModel>
    implements $PredictionModelCopyWith<$Res> {
  _$PredictionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PredictionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currency = null, Object? salary = null}) {
    return _then(
      _value.copyWith(
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            salary: null == salary
                ? _value.salary
                : salary // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PredictionModelImplCopyWith<$Res>
    implements $PredictionModelCopyWith<$Res> {
  factory _$$PredictionModelImplCopyWith(
    _$PredictionModelImpl value,
    $Res Function(_$PredictionModelImpl) then,
  ) = __$$PredictionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'currency', defaultValue: '') String currency,
    @JsonKey(name: 'salary', defaultValue: 0) double salary,
  });
}

/// @nodoc
class __$$PredictionModelImplCopyWithImpl<$Res>
    extends _$PredictionModelCopyWithImpl<$Res, _$PredictionModelImpl>
    implements _$$PredictionModelImplCopyWith<$Res> {
  __$$PredictionModelImplCopyWithImpl(
    _$PredictionModelImpl _value,
    $Res Function(_$PredictionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PredictionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currency = null, Object? salary = null}) {
    return _then(
      _$PredictionModelImpl(
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        salary: null == salary
            ? _value.salary
            : salary // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictionModelImpl extends _PredictionModel {
  const _$PredictionModelImpl({
    @JsonKey(name: 'currency', defaultValue: '') required this.currency,
    @JsonKey(name: 'salary', defaultValue: 0) required this.salary,
  }) : super._();

  factory _$PredictionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictionModelImplFromJson(json);

  @override
  @JsonKey(name: 'currency', defaultValue: '')
  final String currency;
  @override
  @JsonKey(name: 'salary', defaultValue: 0)
  final double salary;

  @override
  String toString() {
    return 'PredictionModel(currency: $currency, salary: $salary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictionModelImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.salary, salary) || other.salary == salary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currency, salary);

  /// Create a copy of PredictionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictionModelImplCopyWith<_$PredictionModelImpl> get copyWith =>
      __$$PredictionModelImplCopyWithImpl<_$PredictionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictionModelImplToJson(this);
  }
}

abstract class _PredictionModel extends PredictionModel {
  const factory _PredictionModel({
    @JsonKey(name: 'currency', defaultValue: '') required final String currency,
    @JsonKey(name: 'salary', defaultValue: 0) required final double salary,
  }) = _$PredictionModelImpl;
  const _PredictionModel._() : super._();

  factory _PredictionModel.fromJson(Map<String, dynamic> json) =
      _$PredictionModelImpl.fromJson;

  @override
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency;
  @override
  @JsonKey(name: 'salary', defaultValue: 0)
  double get salary;

  /// Create a copy of PredictionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PredictionModelImplCopyWith<_$PredictionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

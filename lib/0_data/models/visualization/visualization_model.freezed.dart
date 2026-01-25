// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visualization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VisualizationModel _$VisualizationModelFromJson(Map<String, dynamic> json) {
  return _VisualizationModel.fromJson(json);
}

/// @nodoc
mixin _$VisualizationModel {
  @JsonKey(name: 'image_base64', defaultValue: '')
  String get imageBase64 => throw _privateConstructorUsedError;

  /// Serializes this VisualizationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisualizationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisualizationModelCopyWith<VisualizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisualizationModelCopyWith<$Res> {
  factory $VisualizationModelCopyWith(
    VisualizationModel value,
    $Res Function(VisualizationModel) then,
  ) = _$VisualizationModelCopyWithImpl<$Res, VisualizationModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'image_base64', defaultValue: '') String imageBase64,
  });
}

/// @nodoc
class _$VisualizationModelCopyWithImpl<$Res, $Val extends VisualizationModel>
    implements $VisualizationModelCopyWith<$Res> {
  _$VisualizationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisualizationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? imageBase64 = null}) {
    return _then(
      _value.copyWith(
            imageBase64: null == imageBase64
                ? _value.imageBase64
                : imageBase64 // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VisualizationModelImplCopyWith<$Res>
    implements $VisualizationModelCopyWith<$Res> {
  factory _$$VisualizationModelImplCopyWith(
    _$VisualizationModelImpl value,
    $Res Function(_$VisualizationModelImpl) then,
  ) = __$$VisualizationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'image_base64', defaultValue: '') String imageBase64,
  });
}

/// @nodoc
class __$$VisualizationModelImplCopyWithImpl<$Res>
    extends _$VisualizationModelCopyWithImpl<$Res, _$VisualizationModelImpl>
    implements _$$VisualizationModelImplCopyWith<$Res> {
  __$$VisualizationModelImplCopyWithImpl(
    _$VisualizationModelImpl _value,
    $Res Function(_$VisualizationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VisualizationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? imageBase64 = null}) {
    return _then(
      _$VisualizationModelImpl(
        imageBase64: null == imageBase64
            ? _value.imageBase64
            : imageBase64 // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VisualizationModelImpl extends _VisualizationModel {
  const _$VisualizationModelImpl({
    @JsonKey(name: 'image_base64', defaultValue: '') required this.imageBase64,
  }) : super._();

  factory _$VisualizationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisualizationModelImplFromJson(json);

  @override
  @JsonKey(name: 'image_base64', defaultValue: '')
  final String imageBase64;

  @override
  String toString() {
    return 'VisualizationModel(imageBase64: $imageBase64)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisualizationModelImpl &&
            (identical(other.imageBase64, imageBase64) ||
                other.imageBase64 == imageBase64));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageBase64);

  /// Create a copy of VisualizationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisualizationModelImplCopyWith<_$VisualizationModelImpl> get copyWith =>
      __$$VisualizationModelImplCopyWithImpl<_$VisualizationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VisualizationModelImplToJson(this);
  }
}

abstract class _VisualizationModel extends VisualizationModel {
  const factory _VisualizationModel({
    @JsonKey(name: 'image_base64', defaultValue: '')
    required final String imageBase64,
  }) = _$VisualizationModelImpl;
  const _VisualizationModel._() : super._();

  factory _VisualizationModel.fromJson(Map<String, dynamic> json) =
      _$VisualizationModelImpl.fromJson;

  @override
  @JsonKey(name: 'image_base64', defaultValue: '')
  String get imageBase64;

  /// Create a copy of VisualizationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisualizationModelImplCopyWith<_$VisualizationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddActivityModel _$AddActivityModelFromJson(Map<String, dynamic> json) {
  return _AddActivityModel.fromJson(json);
}

/// @nodoc
mixin _$AddActivityModel {
  int get duration => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  DateTime get endTimestamp => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddActivityModelCopyWith<AddActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddActivityModelCopyWith<$Res> {
  factory $AddActivityModelCopyWith(
          AddActivityModel value, $Res Function(AddActivityModel) then) =
      _$AddActivityModelCopyWithImpl<$Res>;
  $Res call(
      {int duration, String categoryId, DateTime endTimestamp, String userId});
}

/// @nodoc
class _$AddActivityModelCopyWithImpl<$Res>
    implements $AddActivityModelCopyWith<$Res> {
  _$AddActivityModelCopyWithImpl(this._value, this._then);

  final AddActivityModel _value;
  // ignore: unused_field
  final $Res Function(AddActivityModel) _then;

  @override
  $Res call({
    Object? duration = freezed,
    Object? categoryId = freezed,
    Object? endTimestamp = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      endTimestamp: endTimestamp == freezed
          ? _value.endTimestamp
          : endTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AddActivityModelCopyWith<$Res>
    implements $AddActivityModelCopyWith<$Res> {
  factory _$$_AddActivityModelCopyWith(
          _$_AddActivityModel value, $Res Function(_$_AddActivityModel) then) =
      __$$_AddActivityModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int duration, String categoryId, DateTime endTimestamp, String userId});
}

/// @nodoc
class __$$_AddActivityModelCopyWithImpl<$Res>
    extends _$AddActivityModelCopyWithImpl<$Res>
    implements _$$_AddActivityModelCopyWith<$Res> {
  __$$_AddActivityModelCopyWithImpl(
      _$_AddActivityModel _value, $Res Function(_$_AddActivityModel) _then)
      : super(_value, (v) => _then(v as _$_AddActivityModel));

  @override
  _$_AddActivityModel get _value => super._value as _$_AddActivityModel;

  @override
  $Res call({
    Object? duration = freezed,
    Object? categoryId = freezed,
    Object? endTimestamp = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_AddActivityModel(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      endTimestamp: endTimestamp == freezed
          ? _value.endTimestamp
          : endTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddActivityModel implements _AddActivityModel {
  _$_AddActivityModel(
      {required this.duration,
      required this.categoryId,
      required this.endTimestamp,
      required this.userId});

  factory _$_AddActivityModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddActivityModelFromJson(json);

  @override
  final int duration;
  @override
  final String categoryId;
  @override
  final DateTime endTimestamp;
  @override
  final String userId;

  @override
  String toString() {
    return 'AddActivityModel(duration: $duration, categoryId: $categoryId, endTimestamp: $endTimestamp, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddActivityModel &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality()
                .equals(other.endTimestamp, endTimestamp) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(endTimestamp),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_AddActivityModelCopyWith<_$_AddActivityModel> get copyWith =>
      __$$_AddActivityModelCopyWithImpl<_$_AddActivityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddActivityModelToJson(this);
  }
}

abstract class _AddActivityModel implements AddActivityModel {
  factory _AddActivityModel(
      {required final int duration,
      required final String categoryId,
      required final DateTime endTimestamp,
      required final String userId}) = _$_AddActivityModel;

  factory _AddActivityModel.fromJson(Map<String, dynamic> json) =
      _$_AddActivityModel.fromJson;

  @override
  int get duration => throw _privateConstructorUsedError;
  @override
  String get categoryId => throw _privateConstructorUsedError;
  @override
  DateTime get endTimestamp => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AddActivityModelCopyWith<_$_AddActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

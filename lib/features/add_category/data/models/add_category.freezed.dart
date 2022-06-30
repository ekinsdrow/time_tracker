// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddCategory _$AddCategoryFromJson(Map<String, dynamic> json) {
  return _AddCategory.fromJson(json);
}

/// @nodoc
mixin _$AddCategory {
  int get allDuration => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get rootId => throw _privateConstructorUsedError;
  List<String> get subCategoriesIds => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddCategoryCopyWith<AddCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCategoryCopyWith<$Res> {
  factory $AddCategoryCopyWith(
          AddCategory value, $Res Function(AddCategory) then) =
      _$AddCategoryCopyWithImpl<$Res>;
  $Res call(
      {int allDuration,
      String name,
      String rootId,
      List<String> subCategoriesIds,
      String userId});
}

/// @nodoc
class _$AddCategoryCopyWithImpl<$Res> implements $AddCategoryCopyWith<$Res> {
  _$AddCategoryCopyWithImpl(this._value, this._then);

  final AddCategory _value;
  // ignore: unused_field
  final $Res Function(AddCategory) _then;

  @override
  $Res call({
    Object? allDuration = freezed,
    Object? name = freezed,
    Object? rootId = freezed,
    Object? subCategoriesIds = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      allDuration: allDuration == freezed
          ? _value.allDuration
          : allDuration // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rootId: rootId == freezed
          ? _value.rootId
          : rootId // ignore: cast_nullable_to_non_nullable
              as String,
      subCategoriesIds: subCategoriesIds == freezed
          ? _value.subCategoriesIds
          : subCategoriesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AddCategoryCopyWith<$Res>
    implements $AddCategoryCopyWith<$Res> {
  factory _$$_AddCategoryCopyWith(
          _$_AddCategory value, $Res Function(_$_AddCategory) then) =
      __$$_AddCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int allDuration,
      String name,
      String rootId,
      List<String> subCategoriesIds,
      String userId});
}

/// @nodoc
class __$$_AddCategoryCopyWithImpl<$Res> extends _$AddCategoryCopyWithImpl<$Res>
    implements _$$_AddCategoryCopyWith<$Res> {
  __$$_AddCategoryCopyWithImpl(
      _$_AddCategory _value, $Res Function(_$_AddCategory) _then)
      : super(_value, (v) => _then(v as _$_AddCategory));

  @override
  _$_AddCategory get _value => super._value as _$_AddCategory;

  @override
  $Res call({
    Object? allDuration = freezed,
    Object? name = freezed,
    Object? rootId = freezed,
    Object? subCategoriesIds = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_AddCategory(
      allDuration: allDuration == freezed
          ? _value.allDuration
          : allDuration // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rootId: rootId == freezed
          ? _value.rootId
          : rootId // ignore: cast_nullable_to_non_nullable
              as String,
      subCategoriesIds: subCategoriesIds == freezed
          ? _value._subCategoriesIds
          : subCategoriesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddCategory implements _AddCategory {
  _$_AddCategory(
      {required this.allDuration,
      required this.name,
      required this.rootId,
      required final List<String> subCategoriesIds,
      required this.userId})
      : _subCategoriesIds = subCategoriesIds;

  factory _$_AddCategory.fromJson(Map<String, dynamic> json) =>
      _$$_AddCategoryFromJson(json);

  @override
  final int allDuration;
  @override
  final String name;
  @override
  final String rootId;
  final List<String> _subCategoriesIds;
  @override
  List<String> get subCategoriesIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subCategoriesIds);
  }

  @override
  final String userId;

  @override
  String toString() {
    return 'AddCategory(allDuration: $allDuration, name: $name, rootId: $rootId, subCategoriesIds: $subCategoriesIds, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddCategory &&
            const DeepCollectionEquality()
                .equals(other.allDuration, allDuration) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.rootId, rootId) &&
            const DeepCollectionEquality()
                .equals(other._subCategoriesIds, _subCategoriesIds) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(allDuration),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(rootId),
      const DeepCollectionEquality().hash(_subCategoriesIds),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_AddCategoryCopyWith<_$_AddCategory> get copyWith =>
      __$$_AddCategoryCopyWithImpl<_$_AddCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddCategoryToJson(this);
  }
}

abstract class _AddCategory implements AddCategory {
  factory _AddCategory(
      {required final int allDuration,
      required final String name,
      required final String rootId,
      required final List<String> subCategoriesIds,
      required final String userId}) = _$_AddCategory;

  factory _AddCategory.fromJson(Map<String, dynamic> json) =
      _$_AddCategory.fromJson;

  @override
  int get allDuration => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get rootId => throw _privateConstructorUsedError;
  @override
  List<String> get subCategoriesIds => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AddCategoryCopyWith<_$_AddCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

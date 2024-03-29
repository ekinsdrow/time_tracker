// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int get allDuration => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError; //-1 if don't have root
  String? get rootId => throw _privateConstructorUsedError;
  List<String> get subCategoriesIds => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res>;
  $Res call(
      {int allDuration,
      String id,
      String name,
      String? rootId,
      List<String> subCategoriesIds,
      String userId});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res> implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  final Category _value;
  // ignore: unused_field
  final $Res Function(Category) _then;

  @override
  $Res call({
    Object? allDuration = freezed,
    Object? id = freezed,
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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rootId: rootId == freezed
          ? _value.rootId
          : rootId // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_CategoryCopyWith(
          _$_Category value, $Res Function(_$_Category) then) =
      __$$_CategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int allDuration,
      String id,
      String name,
      String? rootId,
      List<String> subCategoriesIds,
      String userId});
}

/// @nodoc
class __$$_CategoryCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements _$$_CategoryCopyWith<$Res> {
  __$$_CategoryCopyWithImpl(
      _$_Category _value, $Res Function(_$_Category) _then)
      : super(_value, (v) => _then(v as _$_Category));

  @override
  _$_Category get _value => super._value as _$_Category;

  @override
  $Res call({
    Object? allDuration = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? rootId = freezed,
    Object? subCategoriesIds = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_Category(
      allDuration: allDuration == freezed
          ? _value.allDuration
          : allDuration // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rootId: rootId == freezed
          ? _value.rootId
          : rootId // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_Category implements _Category {
  _$_Category(
      {required this.allDuration,
      required this.id,
      required this.name,
      required this.rootId,
      required final List<String> subCategoriesIds,
      required this.userId})
      : _subCategoriesIds = subCategoriesIds;

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  final int allDuration;
  @override
  final String id;
  @override
  final String name;
//-1 if don't have root
  @override
  final String? rootId;
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
    return 'Category(allDuration: $allDuration, id: $id, name: $name, rootId: $rootId, subCategoriesIds: $subCategoriesIds, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            const DeepCollectionEquality()
                .equals(other.allDuration, allDuration) &&
            const DeepCollectionEquality().equals(other.id, id) &&
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
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(rootId),
      const DeepCollectionEquality().hash(_subCategoriesIds),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      __$$_CategoryCopyWithImpl<_$_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(this);
  }
}

abstract class _Category implements Category {
  factory _Category(
      {required final int allDuration,
      required final String id,
      required final String name,
      required final String? rootId,
      required final List<String> subCategoriesIds,
      required final String userId}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  int get allDuration => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override //-1 if don't have root
  String? get rootId => throw _privateConstructorUsedError;
  @override
  List<String> get subCategoriesIds => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      throw _privateConstructorUsedError;
}

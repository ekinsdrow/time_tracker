// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_leaf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryLeaf {
  Category get category => throw _privateConstructorUsedError;
  List<CategoryLeaf> get subCategories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryLeafCopyWith<CategoryLeaf> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryLeafCopyWith<$Res> {
  factory $CategoryLeafCopyWith(
          CategoryLeaf value, $Res Function(CategoryLeaf) then) =
      _$CategoryLeafCopyWithImpl<$Res>;
  $Res call({Category category, List<CategoryLeaf> subCategories});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$CategoryLeafCopyWithImpl<$Res> implements $CategoryLeafCopyWith<$Res> {
  _$CategoryLeafCopyWithImpl(this._value, this._then);

  final CategoryLeaf _value;
  // ignore: unused_field
  final $Res Function(CategoryLeaf) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? subCategories = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      subCategories: subCategories == freezed
          ? _value.subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryLeaf>,
    ));
  }

  @override
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$$_CategoryLeafCopyWith<$Res>
    implements $CategoryLeafCopyWith<$Res> {
  factory _$$_CategoryLeafCopyWith(
          _$_CategoryLeaf value, $Res Function(_$_CategoryLeaf) then) =
      __$$_CategoryLeafCopyWithImpl<$Res>;
  @override
  $Res call({Category category, List<CategoryLeaf> subCategories});

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$_CategoryLeafCopyWithImpl<$Res>
    extends _$CategoryLeafCopyWithImpl<$Res>
    implements _$$_CategoryLeafCopyWith<$Res> {
  __$$_CategoryLeafCopyWithImpl(
      _$_CategoryLeaf _value, $Res Function(_$_CategoryLeaf) _then)
      : super(_value, (v) => _then(v as _$_CategoryLeaf));

  @override
  _$_CategoryLeaf get _value => super._value as _$_CategoryLeaf;

  @override
  $Res call({
    Object? category = freezed,
    Object? subCategories = freezed,
  }) {
    return _then(_$_CategoryLeaf(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      subCategories: subCategories == freezed
          ? _value._subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryLeaf>,
    ));
  }
}

/// @nodoc

class _$_CategoryLeaf implements _CategoryLeaf {
  _$_CategoryLeaf(
      {required this.category, required final List<CategoryLeaf> subCategories})
      : _subCategories = subCategories;

  @override
  final Category category;
  final List<CategoryLeaf> _subCategories;
  @override
  List<CategoryLeaf> get subCategories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subCategories);
  }

  @override
  String toString() {
    return 'CategoryLeaf(category: $category, subCategories: $subCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryLeaf &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other._subCategories, _subCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(_subCategories));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryLeafCopyWith<_$_CategoryLeaf> get copyWith =>
      __$$_CategoryLeafCopyWithImpl<_$_CategoryLeaf>(this, _$identity);
}

abstract class _CategoryLeaf implements CategoryLeaf {
  factory _CategoryLeaf(
      {required final Category category,
      required final List<CategoryLeaf> subCategories}) = _$_CategoryLeaf;

  @override
  Category get category => throw _privateConstructorUsedError;
  @override
  List<CategoryLeaf> get subCategories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryLeafCopyWith<_$_CategoryLeaf> get copyWith =>
      throw _privateConstructorUsedError;
}

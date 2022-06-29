// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Categories {
  List<CategoryLeaf> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoriesCopyWith<Categories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesCopyWith<$Res> {
  factory $CategoriesCopyWith(
          Categories value, $Res Function(Categories) then) =
      _$CategoriesCopyWithImpl<$Res>;
  $Res call({List<CategoryLeaf> categories});
}

/// @nodoc
class _$CategoriesCopyWithImpl<$Res> implements $CategoriesCopyWith<$Res> {
  _$CategoriesCopyWithImpl(this._value, this._then);

  final Categories _value;
  // ignore: unused_field
  final $Res Function(Categories) _then;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryLeaf>,
    ));
  }
}

/// @nodoc
abstract class _$$_CategoriesCopyWith<$Res>
    implements $CategoriesCopyWith<$Res> {
  factory _$$_CategoriesCopyWith(
          _$_Categories value, $Res Function(_$_Categories) then) =
      __$$_CategoriesCopyWithImpl<$Res>;
  @override
  $Res call({List<CategoryLeaf> categories});
}

/// @nodoc
class __$$_CategoriesCopyWithImpl<$Res> extends _$CategoriesCopyWithImpl<$Res>
    implements _$$_CategoriesCopyWith<$Res> {
  __$$_CategoriesCopyWithImpl(
      _$_Categories _value, $Res Function(_$_Categories) _then)
      : super(_value, (v) => _then(v as _$_Categories));

  @override
  _$_Categories get _value => super._value as _$_Categories;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$_Categories(
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryLeaf>,
    ));
  }
}

/// @nodoc

class _$_Categories implements _Categories {
  _$_Categories({required final List<CategoryLeaf> categories})
      : _categories = categories;

  final List<CategoryLeaf> _categories;
  @override
  List<CategoryLeaf> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'Categories(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Categories &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  _$$_CategoriesCopyWith<_$_Categories> get copyWith =>
      __$$_CategoriesCopyWithImpl<_$_Categories>(this, _$identity);
}

abstract class _Categories implements Categories {
  factory _Categories({required final List<CategoryLeaf> categories}) =
      _$_Categories;

  @override
  List<CategoryLeaf> get categories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CategoriesCopyWith<_$_Categories> get copyWith =>
      throw _privateConstructorUsedError;
}

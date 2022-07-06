// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'statistic_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatisticCategory _$StatisticCategoryFromJson(Map<String, dynamic> json) {
  return _StatisticCategory.fromJson(json);
}

/// @nodoc
mixin _$StatisticCategory {
  String get title => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Time get time => throw _privateConstructorUsedError;
  List<StatisticCategory> get subCategories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticCategoryCopyWith<StatisticCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticCategoryCopyWith<$Res> {
  factory $StatisticCategoryCopyWith(
          StatisticCategory value, $Res Function(StatisticCategory) then) =
      _$StatisticCategoryCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String id,
      Time time,
      List<StatisticCategory> subCategories});

  $TimeCopyWith<$Res> get time;
}

/// @nodoc
class _$StatisticCategoryCopyWithImpl<$Res>
    implements $StatisticCategoryCopyWith<$Res> {
  _$StatisticCategoryCopyWithImpl(this._value, this._then);

  final StatisticCategory _value;
  // ignore: unused_field
  final $Res Function(StatisticCategory) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? id = freezed,
    Object? time = freezed,
    Object? subCategories = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time,
      subCategories: subCategories == freezed
          ? _value.subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<StatisticCategory>,
    ));
  }

  @override
  $TimeCopyWith<$Res> get time {
    return $TimeCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value));
    });
  }
}

/// @nodoc
abstract class _$$_StatisticCategoryCopyWith<$Res>
    implements $StatisticCategoryCopyWith<$Res> {
  factory _$$_StatisticCategoryCopyWith(_$_StatisticCategory value,
          $Res Function(_$_StatisticCategory) then) =
      __$$_StatisticCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String id,
      Time time,
      List<StatisticCategory> subCategories});

  @override
  $TimeCopyWith<$Res> get time;
}

/// @nodoc
class __$$_StatisticCategoryCopyWithImpl<$Res>
    extends _$StatisticCategoryCopyWithImpl<$Res>
    implements _$$_StatisticCategoryCopyWith<$Res> {
  __$$_StatisticCategoryCopyWithImpl(
      _$_StatisticCategory _value, $Res Function(_$_StatisticCategory) _then)
      : super(_value, (v) => _then(v as _$_StatisticCategory));

  @override
  _$_StatisticCategory get _value => super._value as _$_StatisticCategory;

  @override
  $Res call({
    Object? title = freezed,
    Object? id = freezed,
    Object? time = freezed,
    Object? subCategories = freezed,
  }) {
    return _then(_$_StatisticCategory(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time,
      subCategories: subCategories == freezed
          ? _value._subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<StatisticCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatisticCategory implements _StatisticCategory {
  _$_StatisticCategory(
      {required this.title,
      required this.id,
      required this.time,
      required final List<StatisticCategory> subCategories})
      : _subCategories = subCategories;

  factory _$_StatisticCategory.fromJson(Map<String, dynamic> json) =>
      _$$_StatisticCategoryFromJson(json);

  @override
  final String title;
  @override
  final String id;
  @override
  final Time time;
  final List<StatisticCategory> _subCategories;
  @override
  List<StatisticCategory> get subCategories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subCategories);
  }

  @override
  String toString() {
    return 'StatisticCategory(title: $title, id: $id, time: $time, subCategories: $subCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatisticCategory &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other._subCategories, _subCategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(_subCategories));

  @JsonKey(ignore: true)
  @override
  _$$_StatisticCategoryCopyWith<_$_StatisticCategory> get copyWith =>
      __$$_StatisticCategoryCopyWithImpl<_$_StatisticCategory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatisticCategoryToJson(this);
  }
}

abstract class _StatisticCategory implements StatisticCategory {
  factory _StatisticCategory(
          {required final String title,
          required final String id,
          required final Time time,
          required final List<StatisticCategory> subCategories}) =
      _$_StatisticCategory;

  factory _StatisticCategory.fromJson(Map<String, dynamic> json) =
      _$_StatisticCategory.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  Time get time => throw _privateConstructorUsedError;
  @override
  List<StatisticCategory> get subCategories =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StatisticCategoryCopyWith<_$_StatisticCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

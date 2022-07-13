// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'statistic_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StatisticEvent {
  DateTimeRange get range => throw _privateConstructorUsedError;
  List<CategoryLeaf> get categories => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTimeRange range, List<CategoryLeaf> categories)
        calculateStatistic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTimeRange range, List<CategoryLeaf> categories)?
        calculateStatistic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTimeRange range, List<CategoryLeaf> categories)?
        calculateStatistic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Calculate value) calculateStatistic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Calculate value)? calculateStatistic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Calculate value)? calculateStatistic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatisticEventCopyWith<StatisticEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticEventCopyWith<$Res> {
  factory $StatisticEventCopyWith(
          StatisticEvent value, $Res Function(StatisticEvent) then) =
      _$StatisticEventCopyWithImpl<$Res>;
  $Res call({DateTimeRange range, List<CategoryLeaf> categories});
}

/// @nodoc
class _$StatisticEventCopyWithImpl<$Res>
    implements $StatisticEventCopyWith<$Res> {
  _$StatisticEventCopyWithImpl(this._value, this._then);

  final StatisticEvent _value;
  // ignore: unused_field
  final $Res Function(StatisticEvent) _then;

  @override
  $Res call({
    Object? range = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      range: range == freezed
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryLeaf>,
    ));
  }
}

/// @nodoc
abstract class _$$_CalculateCopyWith<$Res>
    implements $StatisticEventCopyWith<$Res> {
  factory _$$_CalculateCopyWith(
          _$_Calculate value, $Res Function(_$_Calculate) then) =
      __$$_CalculateCopyWithImpl<$Res>;
  @override
  $Res call({DateTimeRange range, List<CategoryLeaf> categories});
}

/// @nodoc
class __$$_CalculateCopyWithImpl<$Res>
    extends _$StatisticEventCopyWithImpl<$Res>
    implements _$$_CalculateCopyWith<$Res> {
  __$$_CalculateCopyWithImpl(
      _$_Calculate _value, $Res Function(_$_Calculate) _then)
      : super(_value, (v) => _then(v as _$_Calculate));

  @override
  _$_Calculate get _value => super._value as _$_Calculate;

  @override
  $Res call({
    Object? range = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$_Calculate(
      range: range == freezed
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryLeaf>,
    ));
  }
}

/// @nodoc

class _$_Calculate implements _Calculate {
  const _$_Calculate(
      {required this.range, required final List<CategoryLeaf> categories})
      : _categories = categories;

  @override
  final DateTimeRange range;
  final List<CategoryLeaf> _categories;
  @override
  List<CategoryLeaf> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'StatisticEvent.calculateStatistic(range: $range, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Calculate &&
            const DeepCollectionEquality().equals(other.range, range) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(range),
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  _$$_CalculateCopyWith<_$_Calculate> get copyWith =>
      __$$_CalculateCopyWithImpl<_$_Calculate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTimeRange range, List<CategoryLeaf> categories)
        calculateStatistic,
  }) {
    return calculateStatistic(range, categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTimeRange range, List<CategoryLeaf> categories)?
        calculateStatistic,
  }) {
    return calculateStatistic?.call(range, categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTimeRange range, List<CategoryLeaf> categories)?
        calculateStatistic,
    required TResult orElse(),
  }) {
    if (calculateStatistic != null) {
      return calculateStatistic(range, categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Calculate value) calculateStatistic,
  }) {
    return calculateStatistic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Calculate value)? calculateStatistic,
  }) {
    return calculateStatistic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Calculate value)? calculateStatistic,
    required TResult orElse(),
  }) {
    if (calculateStatistic != null) {
      return calculateStatistic(this);
    }
    return orElse();
  }
}

abstract class _Calculate implements StatisticEvent {
  const factory _Calculate(
      {required final DateTimeRange range,
      required final List<CategoryLeaf> categories}) = _$_Calculate;

  @override
  DateTimeRange get range => throw _privateConstructorUsedError;
  @override
  List<CategoryLeaf> get categories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CalculateCopyWith<_$_Calculate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StatisticState {
  List<StatisticCategory> get statisticCategories =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StatisticCategory> statisticCategories)
        statistic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<StatisticCategory> statisticCategories)? statistic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StatisticCategory> statisticCategories)? statistic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Statistic value) statistic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Statistic value)? statistic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Statistic value)? statistic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatisticStateCopyWith<StatisticState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticStateCopyWith<$Res> {
  factory $StatisticStateCopyWith(
          StatisticState value, $Res Function(StatisticState) then) =
      _$StatisticStateCopyWithImpl<$Res>;
  $Res call({List<StatisticCategory> statisticCategories});
}

/// @nodoc
class _$StatisticStateCopyWithImpl<$Res>
    implements $StatisticStateCopyWith<$Res> {
  _$StatisticStateCopyWithImpl(this._value, this._then);

  final StatisticState _value;
  // ignore: unused_field
  final $Res Function(StatisticState) _then;

  @override
  $Res call({
    Object? statisticCategories = freezed,
  }) {
    return _then(_value.copyWith(
      statisticCategories: statisticCategories == freezed
          ? _value.statisticCategories
          : statisticCategories // ignore: cast_nullable_to_non_nullable
              as List<StatisticCategory>,
    ));
  }
}

/// @nodoc
abstract class _$$_StatisticCopyWith<$Res>
    implements $StatisticStateCopyWith<$Res> {
  factory _$$_StatisticCopyWith(
          _$_Statistic value, $Res Function(_$_Statistic) then) =
      __$$_StatisticCopyWithImpl<$Res>;
  @override
  $Res call({List<StatisticCategory> statisticCategories});
}

/// @nodoc
class __$$_StatisticCopyWithImpl<$Res>
    extends _$StatisticStateCopyWithImpl<$Res>
    implements _$$_StatisticCopyWith<$Res> {
  __$$_StatisticCopyWithImpl(
      _$_Statistic _value, $Res Function(_$_Statistic) _then)
      : super(_value, (v) => _then(v as _$_Statistic));

  @override
  _$_Statistic get _value => super._value as _$_Statistic;

  @override
  $Res call({
    Object? statisticCategories = freezed,
  }) {
    return _then(_$_Statistic(
      statisticCategories: statisticCategories == freezed
          ? _value._statisticCategories
          : statisticCategories // ignore: cast_nullable_to_non_nullable
              as List<StatisticCategory>,
    ));
  }
}

/// @nodoc

class _$_Statistic implements _Statistic {
  const _$_Statistic(
      {required final List<StatisticCategory> statisticCategories})
      : _statisticCategories = statisticCategories;

  final List<StatisticCategory> _statisticCategories;
  @override
  List<StatisticCategory> get statisticCategories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statisticCategories);
  }

  @override
  String toString() {
    return 'StatisticState.statistic(statisticCategories: $statisticCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Statistic &&
            const DeepCollectionEquality()
                .equals(other._statisticCategories, _statisticCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_statisticCategories));

  @JsonKey(ignore: true)
  @override
  _$$_StatisticCopyWith<_$_Statistic> get copyWith =>
      __$$_StatisticCopyWithImpl<_$_Statistic>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StatisticCategory> statisticCategories)
        statistic,
  }) {
    return statistic(statisticCategories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<StatisticCategory> statisticCategories)? statistic,
  }) {
    return statistic?.call(statisticCategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StatisticCategory> statisticCategories)? statistic,
    required TResult orElse(),
  }) {
    if (statistic != null) {
      return statistic(statisticCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Statistic value) statistic,
  }) {
    return statistic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Statistic value)? statistic,
  }) {
    return statistic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Statistic value)? statistic,
    required TResult orElse(),
  }) {
    if (statistic != null) {
      return statistic(this);
    }
    return orElse();
  }
}

abstract class _Statistic implements StatisticState {
  const factory _Statistic(
          {required final List<StatisticCategory> statisticCategories}) =
      _$_Statistic;

  @override
  List<StatisticCategory> get statisticCategories =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StatisticCopyWith<_$_Statistic> get copyWith =>
      throw _privateConstructorUsedError;
}

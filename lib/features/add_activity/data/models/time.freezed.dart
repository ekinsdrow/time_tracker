// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Time _$TimeFromJson(Map<String, dynamic> json) {
  return _Time.fromJson(json);
}

/// @nodoc
mixin _$Time {
  int get hours => throw _privateConstructorUsedError;
  int get minutes => throw _privateConstructorUsedError;
  int get seconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeCopyWith<Time> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeCopyWith<$Res> {
  factory $TimeCopyWith(Time value, $Res Function(Time) then) =
      _$TimeCopyWithImpl<$Res>;
  $Res call({int hours, int minutes, int seconds});
}

/// @nodoc
class _$TimeCopyWithImpl<$Res> implements $TimeCopyWith<$Res> {
  _$TimeCopyWithImpl(this._value, this._then);

  final Time _value;
  // ignore: unused_field
  final $Res Function(Time) _then;

  @override
  $Res call({
    Object? hours = freezed,
    Object? minutes = freezed,
    Object? seconds = freezed,
  }) {
    return _then(_value.copyWith(
      hours: hours == freezed
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: minutes == freezed
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      seconds: seconds == freezed
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_TimeCopyWith<$Res> implements $TimeCopyWith<$Res> {
  factory _$$_TimeCopyWith(_$_Time value, $Res Function(_$_Time) then) =
      __$$_TimeCopyWithImpl<$Res>;
  @override
  $Res call({int hours, int minutes, int seconds});
}

/// @nodoc
class __$$_TimeCopyWithImpl<$Res> extends _$TimeCopyWithImpl<$Res>
    implements _$$_TimeCopyWith<$Res> {
  __$$_TimeCopyWithImpl(_$_Time _value, $Res Function(_$_Time) _then)
      : super(_value, (v) => _then(v as _$_Time));

  @override
  _$_Time get _value => super._value as _$_Time;

  @override
  $Res call({
    Object? hours = freezed,
    Object? minutes = freezed,
    Object? seconds = freezed,
  }) {
    return _then(_$_Time(
      hours: hours == freezed
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: minutes == freezed
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      seconds: seconds == freezed
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Time implements _Time {
  _$_Time({required this.hours, required this.minutes, required this.seconds});

  factory _$_Time.fromJson(Map<String, dynamic> json) => _$$_TimeFromJson(json);

  @override
  final int hours;
  @override
  final int minutes;
  @override
  final int seconds;

  @override
  String toString() {
    return 'Time(hours: $hours, minutes: $minutes, seconds: $seconds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Time &&
            const DeepCollectionEquality().equals(other.hours, hours) &&
            const DeepCollectionEquality().equals(other.minutes, minutes) &&
            const DeepCollectionEquality().equals(other.seconds, seconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hours),
      const DeepCollectionEquality().hash(minutes),
      const DeepCollectionEquality().hash(seconds));

  @JsonKey(ignore: true)
  @override
  _$$_TimeCopyWith<_$_Time> get copyWith =>
      __$$_TimeCopyWithImpl<_$_Time>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeToJson(this);
  }
}

abstract class _Time implements Time {
  factory _Time(
      {required final int hours,
      required final int minutes,
      required final int seconds}) = _$_Time;

  factory _Time.fromJson(Map<String, dynamic> json) = _$_Time.fromJson;

  @override
  int get hours => throw _privateConstructorUsedError;
  @override
  int get minutes => throw _privateConstructorUsedError;
  @override
  int get seconds => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TimeCopyWith<_$_Time> get copyWith => throw _privateConstructorUsedError;
}

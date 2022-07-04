// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Activity _$$_ActivityFromJson(Map<String, dynamic> json) => _$_Activity(
      categoryId: json['categoryId'] as String,
      duration: json['duration'] as int,
      endTimestamp: DateTime.parse(json['endTimestamp'] as String),
    );

Map<String, dynamic> _$$_ActivityToJson(_$_Activity instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'duration': instance.duration,
      'endTimestamp': instance.endTimestamp.toIso8601String(),
    };

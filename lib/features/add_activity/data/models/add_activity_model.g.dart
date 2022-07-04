// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddActivityModel _$$_AddActivityModelFromJson(Map<String, dynamic> json) =>
    _$_AddActivityModel(
      duration: json['duration'] as int,
      categoryId: json['categoryId'] as String,
      endTimestamp: DateTime.parse(json['endTimestamp'] as String),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$_AddActivityModelToJson(_$_AddActivityModel instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'categoryId': instance.categoryId,
      'endTimestamp': instance.endTimestamp.toIso8601String(),
      'userId': instance.userId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StatisticCategory _$$_StatisticCategoryFromJson(Map<String, dynamic> json) =>
    _$_StatisticCategory(
      title: json['title'] as String,
      id: json['id'] as String,
      time: Time.fromJson(json['time'] as Map<String, dynamic>),
      subCategories: (json['subCategories'] as List<dynamic>)
          .map((e) => StatisticCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StatisticCategoryToJson(
        _$_StatisticCategory instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'time': instance.time,
      'subCategories': instance.subCategories,
    };

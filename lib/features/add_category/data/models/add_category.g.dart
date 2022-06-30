// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddCategory _$$_AddCategoryFromJson(Map<String, dynamic> json) =>
    _$_AddCategory(
      allDuration: json['allDuration'] as int,
      name: json['name'] as String,
      rootId: json['rootId'] as String,
      subCategoriesIds: (json['subCategoriesIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$_AddCategoryToJson(_$_AddCategory instance) =>
    <String, dynamic>{
      'allDuration': instance.allDuration,
      'name': instance.name,
      'rootId': instance.rootId,
      'subCategoriesIds': instance.subCategoriesIds,
      'userId': instance.userId,
    };

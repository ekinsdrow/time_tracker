// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      allDuration: json['allDuration'] as int,
      id: json['id'] as String,
      name: json['name'] as String,
      rootId: json['rootId'] as String?,
      subCategoriesIds: (json['subCategoriesIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'allDuration': instance.allDuration,
      'id': instance.id,
      'name': instance.name,
      'rootId': instance.rootId,
      'subCategoriesIds': instance.subCategoriesIds,
      'userId': instance.userId,
    };

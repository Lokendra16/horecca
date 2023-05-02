// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
      id: json['id'] as int?,
      handle: json['handle'] as String?,
      title: json['title'] as String?,
      updatedAt: json['updatedAt'] as String?,
      bodyHtml: json['bodyHtml'] as String?,
      publishedAt: json['publishedAt'] as String?,
      sortOrder: json['sortOrder'] as String?,
      templateSuffix: json['templateSuffix'] as String?,
      publishedScope: json['publishedScope'] as String?,
      adminGraphqlApiId: json['adminGraphqlApiId'] as String?,
      image: json['image'] == null
          ? null
          : CategoryImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'handle': instance.handle,
      'title': instance.title,
      'updatedAt': instance.updatedAt,
      'bodyHtml': instance.bodyHtml,
      'publishedAt': instance.publishedAt,
      'sortOrder': instance.sortOrder,
      'templateSuffix': instance.templateSuffix,
      'publishedScope': instance.publishedScope,
      'adminGraphqlApiId': instance.adminGraphqlApiId,
      'image': instance.image,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      id: json['id'] as int?,
      lineId: json['lineId'] as String?,
      title: json['title'] as String?,
      body_html: json['body_html'] as String?,
      vendor: json['vendor'] as String?,
      productType: json['productType'] as String?,
      createdAt: json['createdAt'] as String?,
      handle: json['handle'] as String?,
      updatedAt: json['updatedAt'] as String?,
      publishedAt: json['publishedAt'] as String?,
      templateSuffix: json['templateSuffix'] as String?,
      status: json['status'] as String?,
      publishedScope: json['publishedScope'] as String?,
      tags: json['tags'] as String?,
      adminGraphqlApiId: json['adminGraphqlApiId'] as String?,
      image: json['image'] == null
          ? null
          : ProductImages.fromJson(json['image'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ProductImages.fromJson(e as Map<String, dynamic>))
          .toList(),
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => ProductVariants.fromJson(e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => ProductOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      quantity: json['quantity'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lineId': instance.lineId,
      'title': instance.title,
      'body_html': instance.body_html,
      'vendor': instance.vendor,
      'productType': instance.productType,
      'createdAt': instance.createdAt,
      'handle': instance.handle,
      'updatedAt': instance.updatedAt,
      'publishedAt': instance.publishedAt,
      'templateSuffix': instance.templateSuffix,
      'status': instance.status,
      'publishedScope': instance.publishedScope,
      'tags': instance.tags,
      'adminGraphqlApiId': instance.adminGraphqlApiId,
      'image': instance.image,
      'images': instance.images,
      'variants': instance.variants,
      'options': instance.options,
      'quantity': instance.quantity,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOptions _$ProductOptionsFromJson(Map<String, dynamic> json) =>
    ProductOptions(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      name: json['name'] as String?,
      position: json['position'] as int?,
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
      selectedOptionIndex: json['selectedOptionIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductOptionsToJson(ProductOptions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'name': instance.name,
      'position': instance.position,
      'values': instance.values,
      'selectedOptionIndex': instance.selectedOptionIndex,
    };

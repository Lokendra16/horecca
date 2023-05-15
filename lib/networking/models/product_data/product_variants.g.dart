// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVariants _$ProductVariantsFromJson(Map<String, dynamic> json) =>
    ProductVariants(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      title: json['title'] as String?,
      price: json['price'] as String?,
      sku: json['sku'] as String?,
      position: json['position'] as int?,
      inventoryPolicy: json['inventoryPolicy'] as String?,
      fulfillmentService: json['fulfillmentService'] as String?,
      inventoryManagement: json['inventoryManagement'] as String?,
      option1: json['option1'] as String?,
      option2: json['option2'] as String?,
      option3: json['option3'] as String?,
      option4: json['option4'] as String?,
      option5: json['option5'] as String?,
      option6: json['option6'] as String?,
      option7: json['option7'] as String?,
      option8: json['option8'] as String?,
      option9: json['option9'] as String?,
      option10: json['option10'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      taxable: json['taxable'] as bool?,
      barcode: json['barcode'] as String?,
      grams: json['grams'] as int?,
      imageId: json['imageId'] as int?,
      weight: json['weight'] as num?,
      weightUnit: json['weightUnit'] as String?,
      inventoryItemId: json['inventoryItemId'] as int?,
      inventoryQuantity: json['inventoryQuantity'] as int?,
      oldInventoryQuantity: json['oldInventoryQuantity'] as int?,
      requiresShipping: json['requiresShipping'] as bool?,
      adminGraphqlApiId: json['adminGraphqlApiId'] as String?,
    );

Map<String, dynamic> _$ProductVariantsToJson(ProductVariants instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'title': instance.title,
      'price': instance.price,
      'sku': instance.sku,
      'position': instance.position,
      'inventoryPolicy': instance.inventoryPolicy,
      'fulfillmentService': instance.fulfillmentService,
      'inventoryManagement': instance.inventoryManagement,
      'option1': instance.option1,
      'option2': instance.option2,
      'option3': instance.option3,
      'option4': instance.option4,
      'option5': instance.option5,
      'option6': instance.option6,
      'option7': instance.option7,
      'option8': instance.option8,
      'option9': instance.option9,
      'option10': instance.option10,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'taxable': instance.taxable,
      'barcode': instance.barcode,
      'grams': instance.grams,
      'imageId': instance.imageId,
      'weight': instance.weight,
      'weightUnit': instance.weightUnit,
      'inventoryItemId': instance.inventoryItemId,
      'inventoryQuantity': instance.inventoryQuantity,
      'oldInventoryQuantity': instance.oldInventoryQuantity,
      'requiresShipping': instance.requiresShipping,
      'adminGraphqlApiId': instance.adminGraphqlApiId,
    };

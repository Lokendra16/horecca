import 'package:json_annotation/json_annotation.dart';

part 'product_variants.g.dart';

@JsonSerializable()
class ProductVariants {
  int? id;
  int? productId;
  String? title;
  String? price;
  String? sku;
  int? position;
  String? inventoryPolicy;

  String? fulfillmentService;
  String? inventoryManagement;
  String? option1;
  String? option2;
  String? option3;
  String? option4 = "";
  String? option5 = "";
  String? option6 = "";
  String? option7 = "";
  String? option8 = "";
  String? option9 = "";
  String? option10 = "";
  String? createdAt;
  String? updatedAt;
  bool? taxable;
  String? barcode;
  int? grams;
  int? imageId;
  num? weight;
  String? weightUnit;
  int? inventoryItemId;
  int? inventoryQuantity;
  int? oldInventoryQuantity;
  bool? requiresShipping;
  String? adminGraphqlApiId;

  ProductVariants(
      {this.id,
      this.productId,
      this.title,
      this.price,
      this.sku,
      this.position,
      this.inventoryPolicy,
      this.fulfillmentService,
      this.inventoryManagement,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.option5,
      this.option6,
      this.option7,
      this.option8,
      this.option9,
      this.option10,
      this.createdAt,
      this.updatedAt,
      this.taxable,
      this.barcode,
      this.grams,
      this.imageId,
      this.weight,
      this.weightUnit,
      this.inventoryItemId,
      this.inventoryQuantity,
      this.oldInventoryQuantity,
      this.requiresShipping,
      this.adminGraphqlApiId});

  factory ProductVariants.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVariantsToJson(this);
}

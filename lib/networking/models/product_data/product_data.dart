import 'package:json_annotation/json_annotation.dart';
import 'package:the_horeca_store/networking/models/product_data/product_image.dart';
import 'package:the_horeca_store/networking/models/product_data/product_variants.dart';

import 'product_options.dart';

part 'product_data.g.dart';

@JsonSerializable()
class ProductData {
  int? id;
  String? lineId;
  String? title;
  String? body_html;
  String? vendor;
  String? productType;
  String? createdAt;
  String? handle;
  String? updatedAt;
  String? publishedAt;
  String? templateSuffix;
  String? status;
  String? publishedScope;
  String? tags;
  String? adminGraphqlApiId;
  ProductImages? image;
  List<ProductImages>? images;
  List<ProductVariants>? variants;
  List<ProductOptions>? options;
  int quantity;

  ProductData({
    this.id,
    this.lineId,
    this.title,
    this.body_html,
    this.vendor,
    this.productType,
    this.createdAt,
    this.handle,
    this.updatedAt,
    this.publishedAt,
    this.templateSuffix,
    this.status,
    this.publishedScope,
    this.tags,
    this.adminGraphqlApiId,
    this.image,
    this.images,
    this.variants,
    this.options,
    this.quantity = 0,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}

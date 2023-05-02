import 'package:json_annotation/json_annotation.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';

part 'product_detail_response.g.dart';

@JsonSerializable()
class ProductDetailResponse {
  ProductData product;

  ProductDetailResponse({required this.product});

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailResponseToJson(this);
}

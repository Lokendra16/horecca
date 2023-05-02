
import 'package:json_annotation/json_annotation.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductResponse {
  List<ProductData>? products;

  ProductResponse({this.products});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
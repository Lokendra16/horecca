import 'package:json_annotation/json_annotation.dart';

part 'product_options.g.dart';

@JsonSerializable()
class ProductOptions {
  int? id;
  int? productId;
  String? name;
  int? position;
  List<String>? values;
  int selectedOptionIndex;

  ProductOptions(
      {this.id,
      this.productId,
      this.name,
      this.position,
      this.values,
      this.selectedOptionIndex = 0});

  factory ProductOptions.fromJson(Map<String, dynamic> json) => _$ProductOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOptionsToJson(this);
}

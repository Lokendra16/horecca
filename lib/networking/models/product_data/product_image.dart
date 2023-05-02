import 'package:json_annotation/json_annotation.dart';

part 'product_image.g.dart';

@JsonSerializable()
class ProductImages {
  String? src;

  ProductImages({
    this.src,
  });

  factory ProductImages.fromJson(Map<String, dynamic> json) => _$ProductImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductImagesToJson(this);
}

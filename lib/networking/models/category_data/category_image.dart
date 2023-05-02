import 'package:json_annotation/json_annotation.dart';

part 'category_image.g.dart';
@JsonSerializable()
class CategoryImage {

  String? src;

  CategoryImage({ this.src});


  factory CategoryImage.fromJson(Map<String, dynamic> json) =>
      _$CategoryImageFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryImageToJson(this);
}
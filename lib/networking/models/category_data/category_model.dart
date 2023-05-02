import 'package:json_annotation/json_annotation.dart';
import 'package:the_horeca_store/networking/models/category_data/category_data.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryResponse {
  List<CategoryData>? custom_collections;

  CategoryResponse({this.custom_collections});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}



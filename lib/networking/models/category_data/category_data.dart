import 'package:json_annotation/json_annotation.dart';
import 'package:the_horeca_store/networking/models/category_data/category_image.dart';

part 'category_data.g.dart';

@JsonSerializable()
class CategoryData {
  int? id;
  String? handle;
  String? title;
  String? updatedAt;
  String? bodyHtml;
  String? publishedAt;
  String? sortOrder;
  String? templateSuffix;
  String? publishedScope;
  String? adminGraphqlApiId;
  CategoryImage? image;


  CategoryData(
      {this.id,
        this.handle,
        this.title,
        this.updatedAt,
        this.bodyHtml,
        this.publishedAt,
        this.sortOrder,
        this.templateSuffix,
        this.publishedScope,
        this.adminGraphqlApiId,
        this.image,
      });

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
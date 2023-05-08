import 'package:json_annotation/json_annotation.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
  String? availability;
  double? best_price;
  String? brand;
  String? capacity;
  List<String>? categories;
  String? color;
  String? description;
  String? df_grouping_id;
  String? dfid;
  double? dfscore;
  String? group_id;
  String? gtin;
  String? handle;
  String? id;
  String? image_link;
  String? link;
  String? mpn;
  double? price;
  String? size;
  String? tags;
  String? title;
  String? type;
  String? casePack;
  String? uom;

  Results(
      {required this.availability,
        required this.best_price,
        required this.brand,
        required this.capacity,
        required this.categories,
        required this.color,
        required this.description,
        required this.df_grouping_id,
        required this.dfid,
        required this.dfscore,required this.group_id,
        required this.gtin,
        required this.handle,
        required this.id,
        required this.image_link,
        required this.link,
        required this.mpn,
        required this.price,
        required this.size,
        required this.tags,
        required this.title,
        required this.type,
        required this.casePack,
        required this.uom



      });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
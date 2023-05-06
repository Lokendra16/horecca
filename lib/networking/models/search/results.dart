import 'package:json_annotation/json_annotation.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
  String? availability;
  int? bestPrice;
  String? brand;
  String? capacity;
  List<String>? categories;
  String? color;
  String? description;
  String? dfGroupingId;
  String? dfid;
  double? dfscore;
  String? groupId;
  String? gtin;
  String? handle;
  String? id;
  String? imageLink;
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
        required this.bestPrice,
        required this.brand,
        required this.capacity,
        required this.categories,
        required this.color,
        required this.description,
        required this.dfGroupingId,
        required this.dfid,
        required this.dfscore,required this.groupId,
        required this.gtin,
        required this.handle,
        required this.id,
        required this.imageLink,
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
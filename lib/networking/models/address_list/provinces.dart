import 'package:json_annotation/json_annotation.dart';

part 'provinces.g.dart';

@JsonSerializable()
class Provinces {
  int? id;
  int? countryId;
  String? name;
  String? code;
  String? taxName;
  double? tax;
  int? taxPercentage;

  Provinces(
      {this.id, this.countryId, this.name, this.code, this.taxName, this.tax, this.taxPercentage});

  factory Provinces.fromJson(Map<String, dynamic> json) => _$ProvincesFromJson(json);

  Map<String, dynamic> toJson() => _$ProvincesToJson(this);
}

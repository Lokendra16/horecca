import 'package:json_annotation/json_annotation.dart';
import 'provinces.dart';

part 'countries.g.dart';

@JsonSerializable()
class Countries {
  int? id;
  String? name;
  String? code;
  String? taxName;
  double? tax;
  List<Provinces>? provinces;

  Countries({this.id, this.name, this.code, this.taxName, this.tax, this.provinces});

  factory Countries.fromJson(Map<String, dynamic> json) => _$CountriesFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesToJson(this);
}

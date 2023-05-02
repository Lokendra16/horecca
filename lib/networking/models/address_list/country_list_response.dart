import 'package:json_annotation/json_annotation.dart';

import 'countries.dart';

part 'country_list_response.g.dart';

@JsonSerializable()
class CountryListResponse {

  List<Countries>? countries;

  CountryListResponse({this.countries});

  factory CountryListResponse.fromJson(Map<String, dynamic> json) => _$CountryListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryListResponseToJson(this);
}

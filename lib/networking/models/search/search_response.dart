import 'package:json_annotation/json_annotation.dart';
import 'package:the_horeca_store/networking/models/search/results.dart';
part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  List<Results>? results;
  int? resultsPerPage;
  int? total;
  int? totalFound;

  SearchResponse(
      {required this.results,
      required this.resultsPerPage,
      required this.total,
      required this.totalFound});

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}



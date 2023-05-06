// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultsPerPage: json['resultsPerPage'] as int?,
      total: json['total'] as int?,
      totalFound: json['totalFound'] as int?,
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'resultsPerPage': instance.resultsPerPage,
      'total': instance.total,
      'totalFound': instance.totalFound,
    };

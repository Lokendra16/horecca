// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryListResponse _$CountryListResponseFromJson(Map<String, dynamic> json) =>
    CountryListResponse(
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Countries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryListResponseToJson(
        CountryListResponse instance) =>
    <String, dynamic>{
      'countries': instance.countries,
    };

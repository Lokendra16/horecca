// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Countries _$CountriesFromJson(Map<String, dynamic> json) => Countries(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      taxName: json['taxName'] as String?,
      tax: (json['tax'] as num?)?.toDouble(),
      provinces: (json['provinces'] as List<dynamic>?)
          ?.map((e) => Provinces.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountriesToJson(Countries instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'taxName': instance.taxName,
      'tax': instance.tax,
      'provinces': instance.provinces,
    };

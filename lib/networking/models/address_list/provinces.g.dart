// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provinces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Provinces _$ProvincesFromJson(Map<String, dynamic> json) => Provinces(
      id: json['id'] as int?,
      countryId: json['countryId'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      taxName: json['taxName'] as String?,
      tax: (json['tax'] as num?)?.toDouble(),
      taxPercentage: json['taxPercentage'] as int?,
    );

Map<String, dynamic> _$ProvincesToJson(Provinces instance) => <String, dynamic>{
      'id': instance.id,
      'countryId': instance.countryId,
      'name': instance.name,
      'code': instance.code,
      'taxName': instance.taxName,
      'tax': instance.tax,
      'taxPercentage': instance.taxPercentage,
    };

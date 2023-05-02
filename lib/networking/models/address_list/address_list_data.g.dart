// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressesData _$AddressesDataFromJson(Map<String, dynamic> json) =>
    AddressesData(
      id: json['id'] as int?,
      customerId: json['customerId'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      company: json['company'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      city: json['city'] as String?,
      province: json['province'] as String?,
      country: json['country'] as String?,
      zip: json['zip'] as String?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      provinceCode: json['provinceCode'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
    )..isDefault = json['default'] as bool?;

Map<String, dynamic> _$AddressesDataToJson(AddressesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'company': instance.company,
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'zip': instance.zip,
      'default': instance.isDefault,
      'phone': instance.phone,
      'name': instance.name,
      'provinceCode': instance.provinceCode,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
    };

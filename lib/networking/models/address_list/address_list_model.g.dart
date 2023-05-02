// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressListModel _$AddressListModelFromJson(Map<String, dynamic> json) =>
    AddressListModel(
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressListModelToJson(AddressListModel instance) =>
    <String, dynamic>{
      'addresses': instance.addresses,
    };

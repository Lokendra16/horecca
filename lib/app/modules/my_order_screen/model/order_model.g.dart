// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      processedAt: json['processedAt'] as String?,
      fulfillmentStatus: json['fulfillmentStatus'] as String?,
      financialStatus: json['financialStatus'] as String?,
      totalAmount: json['totalAmount'] as String?,
      totalCC: json['totalCC'] as String?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'processedAt': instance.processedAt,
      'fulfillmentStatus': instance.fulfillmentStatus,
      'financialStatus': instance.financialStatus,
      'totalAmount': instance.totalAmount,
      'totalCC': instance.totalCC,
    };

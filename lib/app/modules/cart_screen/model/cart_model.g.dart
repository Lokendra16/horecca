// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      checkoutUrl: json['checkoutUrl'] as String?,
      totalAmount: json['totalAmount'] as String? ?? "0.0",
      totalCC: json['totalCC'] as String? ?? "",
      subtotalAmount: json['subtotalAmount'] as String? ?? "0.0",
      subtotalCC: json['subtotalCC'] as String? ?? "",
      totalDutyAmount: json['totalDutyAmount'] as String? ?? "0.0",
      totalDutyCC: json['totalDutyCC'] as String? ?? "",
      totalTaxAmount: json['totalTaxAmount'] as String? ?? "0.0",
      totalTaxCC: json['totalTaxCC'] as String? ?? "",
      productList: (json['productList'] as List<dynamic>?)
          ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'checkoutUrl': instance.checkoutUrl,
      'totalAmount': instance.totalAmount,
      'subtotalAmount': instance.subtotalAmount,
      'totalDutyAmount': instance.totalDutyAmount,
      'totalTaxAmount': instance.totalTaxAmount,
      'totalCC': instance.totalCC,
      'subtotalCC': instance.subtotalCC,
      'totalDutyCC': instance.totalDutyCC,
      'totalTaxCC': instance.totalTaxCC,
      'productList': instance.productList,
    };

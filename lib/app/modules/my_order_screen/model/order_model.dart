import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  final String? id;
  final String? name;
  final String? processedAt;
  final String? fulfillmentStatus;
  final String? financialStatus;
  final String? totalAmount;
  final String? totalCC;

  OrderModel({
    this.id,
    this.name,
    this.processedAt,
    this.fulfillmentStatus,
    this.financialStatus,
    this.totalAmount,
    this.totalCC,
  });
}

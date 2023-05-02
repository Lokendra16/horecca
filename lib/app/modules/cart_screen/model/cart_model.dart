import 'package:json_annotation/json_annotation.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final String? checkoutUrl;

  final String totalAmount;
  final String subtotalAmount;
  final String totalDutyAmount;
  final String totalTaxAmount;
  final String totalCC;
  final String subtotalCC;
  final String totalDutyCC;
  final String totalTaxCC;
  final List<ProductData>? productList;

  CartModel({
    this.checkoutUrl,
    this.totalAmount = "0.0",
    this.totalCC = "",
    this.subtotalAmount = "0.0",
    this.subtotalCC = "",
    this.totalDutyAmount = "0.0",
    this.totalDutyCC = "",
    this.totalTaxAmount = "0.0",
    this.totalTaxCC = "",
    this.productList,
  });
}

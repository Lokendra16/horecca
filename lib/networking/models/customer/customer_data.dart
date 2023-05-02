import 'package:json_annotation/json_annotation.dart';
import 'package:the_horeca_store/networking/models/product_data/product_image.dart';
import 'package:the_horeca_store/networking/models/product_data/product_variants.dart';

part 'customer_data.g.dart';

@JsonSerializable()
class CustomerData {
  String? id;
  String? firstName;
  String? lastName;
  bool? acceptsMarketing;
  String? email;
  String? phone;

  CustomerData({
    this.id,
    this.firstName,
    this.lastName,
    this.acceptsMarketing,
    this.email,
    this.phone,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) => _$CustomerDataFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDataToJson(this);
}

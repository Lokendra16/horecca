import 'package:json_annotation/json_annotation.dart';

import 'address_list_data.dart';

part 'address_list_model.g.dart';

@JsonSerializable()
class AddressListModel {
  List<AddressesData>? addresses;

  AddressListModel({this.addresses});

  factory AddressListModel.fromJson(Map<String, dynamic> json) => _$AddressListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressListModelToJson(this);
}

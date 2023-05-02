import 'package:json_annotation/json_annotation.dart';
part 'address_list_data.g.dart';

@JsonSerializable()
class AddressesData {
  int? id;
  int? customerId;
  String? firstName;
  String? lastName;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? province;
  String? country;
  String? zip;

  @JsonKey(name: 'default')
  bool? isDefault;

  String? phone;
  String? name;
  String? provinceCode;
  String? countryCode;
  String? countryName;

  AddressesData({this.id, this.customerId, this.firstName, this.lastName, this.company, this.address1, this.address2, this.city, this.province, this.country, this.zip, this.phone, this.name, this.provinceCode, this.countryCode, this.countryName});
factory AddressesData.fromJson(Map<String, dynamic> json) =>
_$AddressesDataFromJson(json);

Map<String, dynamic> toJson() => _$AddressesDataToJson(this);
  }
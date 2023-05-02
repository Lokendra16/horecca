import 'package:json_annotation/json_annotation.dart';

import 'models/address_list/address_list_data.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  bool? status;
  BaseResponse({this.status});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class Address {
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
  @JsonKey(name: 'userId')
  int userId;
  String region;
  String province;
  String district;
  String fullAddress;

  Address({
    required this.userId,
    required this.region,
    required this.province,
    required this.district,
    required this.fullAddress,
  });
}

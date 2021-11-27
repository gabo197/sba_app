import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable()
class Customer {
  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
  @JsonKey(name: 'userId')
  int userId;
  String firstName;
  String lastName;
  String imageUrl;
  String description;
  String phoneNumber;

  Customer({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.description,
    required this.phoneNumber,
  });
}

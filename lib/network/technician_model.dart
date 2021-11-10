import 'package:json_annotation/json_annotation.dart';

part 'technician_model.g.dart';

@JsonSerializable()
class Technician {
  factory Technician.fromJson(Map<String, dynamic> json) =>
      _$TechnicianFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianToJson(this);
  @JsonKey(name: 'userId')
  int userId;
  String firstName;
  String lastName;
  String imageUrl;
  String description;
  String phoneNumber;

  Technician({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.description,
    required this.phoneNumber,
  });
}

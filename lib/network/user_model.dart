import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class APIUser {
  factory APIUser.fromJson(Map<String, dynamic> json) =>
      _$APIUserFromJson(json);

  Map<String, dynamic> toJson() => _$APIUserToJson(this);
  @JsonKey(name: 'id')
  int id;
  String email;
  String userType;
  String password;

  APIUser({
    required this.id,
    required this.email,
    required this.userType,
    required this.password,
  });
}

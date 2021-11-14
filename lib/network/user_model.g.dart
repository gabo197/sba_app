// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIUser _$APIUserFromJson(Map<String, dynamic> json) {
  return APIUser(
    id: json['id'] as int,
    email: json['email'] as String,
    userType: json['userType'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$APIUserToJson(APIUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userType': instance.userType,
      'password': instance.password,
    };

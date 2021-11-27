// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    userId: json['userId'] as int,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    imageUrl: json['imageUrl'] as String,
    description: json['description'] as String,
    phoneNumber: json['phoneNumber'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'phoneNumber': instance.phoneNumber,
    };

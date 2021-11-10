// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Technician _$TechnicianFromJson(Map<String, dynamic> json) {
  return Technician(
    userId: json['userId'] as int,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    imageUrl: json['imageUrl'] as String,
    description: json['description'] as String,
    phoneNumber: json['phoneNumber'] as String,
  );
}

Map<String, dynamic> _$TechnicianToJson(Technician instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'phoneNumber': instance.phoneNumber,
    };

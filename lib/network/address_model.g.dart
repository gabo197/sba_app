// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    userId: json['userId'] as int,
    region: json['region'] as String,
    province: json['province'] as String,
    district: json['district'] as String,
    fullAddress: json['fullAddress'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'userId': instance.userId,
      'region': instance.region,
      'province': instance.province,
      'district': instance.district,
      'fullAddress': instance.fullAddress,
    };

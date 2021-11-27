import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'address_model.dart';
import 'constants.dart';

class AddressService {
  Future<Address> createAddress(String region, String province, String district,
      String fullAddress, int userId) async {
    final response = await http.post(
      Uri.parse('$apiUrl/address?userId=$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEwOCIsIm5iZiI6MTYzNjkzNDc1NiwiZXhwIjoxNjM4MTQ0MzU2LCJpYXQiOjE2MzY5MzQ3NTZ9.AgFGeA6z2SRouDeqtHnIRbJM0MYZZkP_F4AFbb18pvE',
      },
      body: jsonEncode(
        <String, String>{
          'region': region,
          'province': province,
          'district': district,
          'fullAddress': fullAddress,
        },
      ),
    );

    if (response.statusCode == 200) {
      return Address.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al crear la dirección.');
    }
  }
}

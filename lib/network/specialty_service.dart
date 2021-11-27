import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sba_app/network/specialty_model.dart';
import 'specialty_model.dart';

const String apiUrl =
    'https://immense-garden-67436.herokuapp.com/api/specialty';

List<Specialty> parseSpecialties(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Specialty>((json) => Specialty.fromJson(json)).toList();
}

class SpecialtyService {
  Future<List<Specialty>> fetchSpecialties(http.Client client) async {
    final response = await client.get(Uri.parse(apiUrl));

    return compute(parseSpecialties, response.body);
  }

  Future<Specialty> createSpecialty(
    String name,
  ) async {
    final response = await http.post(
      Uri.parse('$apiUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEwOCIsIm5iZiI6MTYzNjkzNDc1NiwiZXhwIjoxNjM4MTQ0MzU2LCJpYXQiOjE2MzY5MzQ3NTZ9.AgFGeA6z2SRouDeqtHnIRbJM0MYZZkP_F4AFbb18pvE',
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );

    if (response.statusCode == 200) {
      return Specialty.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al crear el customer');
    }
  }
}

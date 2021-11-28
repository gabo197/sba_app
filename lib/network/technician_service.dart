import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sba_app/network/specialty_model.dart';
import 'technician_model.dart';

const String apiUrl =
    'https://immense-garden-67436.herokuapp.com/api/technician';

List<Technician> parseTechnicians(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Technician>((json) => Technician.fromJson(json)).toList();
}

List<Specialty> parseTechnicianSpecialties(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Specialty>((json) => Specialty.fromJson(json)).toList();
}

class TechnicianService {
  Future<List<Technician>> fetchTechnicians(http.Client client) async {
    final response = await client.get(Uri.parse(apiUrl));

    return compute(parseTechnicians, response.body);
  }

  Future<List<Specialty>> fetchTechnicianSpecialties(
      http.Client client, int userId) async {
    final response = await client.get(Uri.parse('$apiUrl/$userId/specialties'));

    return compute(parseTechnicianSpecialties, response.body);
  }

  Future<Specialty> assignTechnicianSpecialty(
      int userId, int specialtyId) async {
    final response = await http.post(
      Uri.parse('$apiUrl/$userId/specialties/$specialtyId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEwOCIsIm5iZiI6MTYzNjkzNDc1NiwiZXhwIjoxNjM4MTQ0MzU2LCJpYXQiOjE2MzY5MzQ3NTZ9.AgFGeA6z2SRouDeqtHnIRbJM0MYZZkP_F4AFbb18pvE',
      },
    );

    if (response.statusCode == 204) {
      return Specialty(id: 0, name: "ga");
    } else {
      throw Exception('Error al asignar la especialidad');
    }
  }

  Future<Technician> createTechnician(
      String firstName,
      String lastName,
      String imageUrl,
      String description,
      String phoneNumber,
      int userId) async {
    final response = await http.post(
      Uri.parse('$apiUrl?userId=$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEwOCIsIm5iZiI6MTYzNjkzNDc1NiwiZXhwIjoxNjM4MTQ0MzU2LCJpYXQiOjE2MzY5MzQ3NTZ9.AgFGeA6z2SRouDeqtHnIRbJM0MYZZkP_F4AFbb18pvE',
      },
      body: jsonEncode(<String, String>{
        'firstName': firstName,
        'lastName': lastName,
        'imageUrl': imageUrl,
        'description': description,
        'phoneNumber': phoneNumber,
      }),
    );

    if (response.statusCode == 200) {
      return Technician.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al crear el técnico');
    }
  }
}

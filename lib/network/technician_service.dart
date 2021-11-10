import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'technician_model.dart';

const String apiUrl =
    'https://immense-garden-67436.herokuapp.com/api/technician';

List<Technician> parseTechnicians(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Technician>((json) => Technician.fromJson(json)).toList();
}

class TechnicianService {
  Future<List<Technician>> fetchTechnicians(http.Client client) async {
    final response = await client.get(Uri.parse(apiUrl));

    return compute(parseTechnicians, response.body);
  }
}

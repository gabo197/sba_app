import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'user_model.dart';

const String apiUrl = 'https://immense-garden-67436.herokuapp.com/api/user';

class UserService {
  Future<APIUser> createUser(String email, String password) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return APIUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al crear el usuario');
    }
  }
}

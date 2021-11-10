import 'package:http/http.dart' as http;
import 'dart:convert';

class UserAuth {
  final int? id;
  final String? email;
  final String? token;
  final String? message;

  UserAuth({this.id, this.email, this.token, this.message});

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(
        id: json['id'],
        email: json['email'],
        token: json['token'],
        message: json['message']);
  }
}

Future<UserAuth> attemptLogin(String email, String password) async {
  final response = await http.post(
    Uri.parse(
        'https://immense-garden-67436.herokuapp.com/api/user/authenticate'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 400) {
    return UserAuth.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('ke');
  }
}

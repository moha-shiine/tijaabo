import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = "http://192.168.100.1/login";
//http://localhost:81/login/log.php
  // User registration
  Future<Map<String, dynamic>> registerUser(String username, String password) async {
    final url = Uri.parse("$_baseUrl/log.php");
    try {
      final response = await http.post(
        url,
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'error': 'Server error: ${response.statusCode}'};
      }
    } catch (e) {
      return {'error': 'Request failed: $e'};
    }
  }
}

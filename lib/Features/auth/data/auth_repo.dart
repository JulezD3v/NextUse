// lib/features/auth/data/auth_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  static const String baseUrl = 'https://nextuse-api.onrender.com';

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name.trim(),
        'email': email.trim(),
        'password': password.trim(),
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body); // { token, user }
    } else {
      final errorBody = jsonDecode(response.body);
      throw Exception(errorBody['message'] ?? 'Registration failed: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email.trim(),
        'password': password.trim(),
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // { token, user }
    } else {
      final errorBody = jsonDecode(response.body);
      throw Exception(errorBody['message'] ?? 'Login failed: ${response.statusCode}');
    }
  }
}
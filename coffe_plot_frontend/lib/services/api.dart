// api.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coffe_plot_frontend/services/base_url.dart';

class ApiService {
  Future<Map<String, dynamic>> signup(
      String username, String email, String password, String account_type) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/signup/'),
      body: {
        'username': username,
        'email': email,
        'password': password,
        'account_type': account_type,
      },
    );

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/login/'),
      body: {
        'username': username,
        'password': password,
      },
    );

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> getAccountType(String authToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/auth/accounttype/'),
      headers: {
        'Authorization': 'Token $authToken',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch account type');
    }
  }
}

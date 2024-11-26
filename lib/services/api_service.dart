import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> createUser(Map<String, dynamic> userData) async {
  final url = Uri.parse('http://localhost:5000/api/user/create');
  final headers = {'Content-Type': 'application/json'};
  try {
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(userData),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create user: ${response.body}');
    }
  } catch (e) {
    throw Exception('Error creating user: $e');
  }
}

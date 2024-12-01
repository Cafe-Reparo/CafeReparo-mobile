import 'dart:convert';

import 'package:cafe_reparo_mobile/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // URL da API externa (defina em 'config.dart')
  final String apiEndpoint = register; // Substitua por sua variável de endpoint

  // Método de cadastro
  Future<String?> signup({
    required String email,
    required String password,
    required String name,
    required String surname,
    required DateTime date,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await createUser({
        "email": email,
        "name": name,
        "surname": surname,
        "birthday": date.toString(),
      });

      return null; // Cadastro bem-sucedido
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Já existe uma conta com esse e-mail.';
      } else if (e.code == 'invalid-email') {
        return 'O e-mail fornecido é inválido.';
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> createUser(Map<String, dynamic> userData) async {
    final url = Uri.parse(register);
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

  Future<String?> signin(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        return 'E-mail inválido';
      } else if (e.code == 'invalid-credential') {
        return 'Senha inválida';
      }
      return null;
    }

    return null;
  }

  Future<void> signout() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw Exception('No user signed in');
    }
  }

  Future<Map<String, dynamic>> updateUser(Map<String, dynamic> userData) async {
    final url = Uri.parse(register);
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

  Future<void> updateUserDetails(Map<String, dynamic> updatedData) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      String? email = currentUser?.email!;

      final response = await http.put(
        Uri.parse('http://localhost:5000/api/user/update-one/$email'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Usuário atualizado com sucesso!');
        }
      } else {
        if (kDebugMode) {
          print('Erro ao atualizar o usuário: ${response.body}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erro: $e');
      }
    }
  }

  Future<Map<String, dynamic>> readOneUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    String? email = currentUser?.email!;

    try {
      final response = await http.get(
        Uri.parse('http://localhost:5000/api/user/read-one/$email'),
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> userData = json.decode(response.body);
        return userData;
      } else {
        // Handle server error or invalid response
        throw Exception('Erro ao buscar dados: ${response.body}');
      }
    } catch (e) {
      // Handle other errors like network issues, JSON parsing, etc.
      if (kDebugMode) {
        print('Erro: $e');
      }
      throw Exception('Erro ao buscar dados do usuário.');
    }
  }
}
